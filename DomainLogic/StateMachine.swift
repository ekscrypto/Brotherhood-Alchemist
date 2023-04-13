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
    func mutate(_ initialState: AppState) throws -> AppState
}

actor StateMachine {
    private(set) var appState: AppState = .initial
    private let appStatePublisher: PassthroughSubject<AppState, Never> = .init()
    
    func appStateUpdates() -> AnyPublisher<AppState, Never> {
        appStatePublisher
            .throttle(for: 0.75, scheduler: RunLoop.main, latest: true)
            .receive(on: RunLoop.main)
            .subscribe(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    @discardableResult
    func ingest(_ atomicOperation: AtomicOperation) throws -> Self {
        appState = try atomicOperation.mutate(appState)
        appStatePublisher.send(appState)
        return self
    }
}
