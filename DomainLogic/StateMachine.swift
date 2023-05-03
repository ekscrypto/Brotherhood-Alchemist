//
//  StateMachine.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation
import Combine

public protocol AtomicOperation: Sendable {
    func mutate(_ initialState: AppState) throws -> (AppState, [ExternalActivity])
}

public typealias ExternalActivity = (StateMachine) -> Void

public actor StateMachine {
    public static var `default`: StateMachine {
        .init()
    }
    
    private(set) var appState: AppState = .initial
    let appStatePublisher: PassthroughSubject<AppState, Never> = .init()
    nonisolated let singletons: Singletons = .init()
    
    init() {
        _ = viewRepPublisher
    }
    
    private static let viewModelQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        queue.name = "ViewModel"
        queue.qualityOfService = .userInitiated
        return queue
    }()
    
    nonisolated private(set) public lazy var viewRepPublisher: AnyPublisher<ViewRep, Never> = appStatePublisher
//            .throttle(for: 0.100, scheduler: Self.viewModelQueue, latest: true)
            .subscribe(on: Self.viewModelQueue)
            .receive(on: Self.viewModelQueue)
            .map { ViewRep(from: $0) }
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    
    @discardableResult
    public func ingest(_ atomicOperation: AtomicOperation) throws -> Self {
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
