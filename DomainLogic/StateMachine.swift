//
//  StateMachine.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation
import Combine

protocol AtomicOperation: Sendable {
    func mutate(_ initialState: AppState) throws -> (AppState, [ExternalActivity])
}
typealias ExternalActivity = (StateMachine) -> Void

actor StateMachine {
    private(set) var appState: AppState = .initial
    private let appStatePublisher: PassthroughSubject<AppState, Never> = .init()
    let singletons = Singletons()
    
    func appStateUpdates() -> AnyPublisher<AppState, Never> {
        appStatePublisher
            .throttle(
                for: 0.250,
                scheduler: RunLoop.main,
                latest: true)
            .receive(on: RunLoop.main)
            .subscribe(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    @discardableResult
    func ingest(_ atomicOperation: AtomicOperation) throws -> Self {
        let (updatedState, externalActivities) = try atomicOperation.mutate(appState)
        appState = updatedState
        appStatePublisher.send(updatedState)
        
        if !externalActivities.isEmpty {
            Task.detached {
                externalActivities.forEach { activity in
                    activity(self)
                }
            }
        }
        
        return self
    }
}
