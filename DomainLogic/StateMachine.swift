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
    /// Attempt to mutate the AppState and ViewRepCache using the provided AtomicOperation
    ///
    /// - Parameters:
    ///   - appState: The AppState currently stored in the StateMachine prior to the mutation
    ///   - viewRepCache: The ViewRepCache currently stored in the StateMachine prior to the mutation
    /// - Returns: Tuple contiaining the updated AppState, ViewRepCache and a dictionary of the external activities
    /// to start upon successful completion of the mutation.  If the identifier starts with begins with "." the task
    /// will be launched but will not be tracked by the state machine.  If the identifier does not start with "." the
    /// task will be launched and tracked by the state machine, and if this same identifier was previously used for
    /// another task before this previous task will be cancelled.
    ///
    func mutate(
        appState: AppState,
        viewRepCache: ViewRepCache
    ) throws -> (
        AppState,
        ViewRepCache,
        [String: ExternalActivity]
    )
}

public typealias ExternalActivity = (StateMachine) -> Task<Void, Error>

public actor StateMachine {
    public static var `default`: StateMachine {
        .init()
    }
    
    private(set) var appState: AppState = .initial
    private(set) var viewRepCache: ViewRepCache = .invalidated
    private(set) var cancellableTasks: [String: Task<Void, Error>] = [:]
    
    let appStateViewRepCachePublisher: PassthroughSubject<(AppState, ViewRepCache), Never> = .init()
    nonisolated let singletons: Singletons = .init()
    
    init() {
        _ = viewRepPublisher
    }
        
    nonisolated private(set) public lazy var viewRepPublisher: AnyPublisher<ViewRep, Never> =
    appStateViewRepCachePublisher
//            .throttle(for: 0.100, scheduler: Self.viewModelQueue, latest: true)
            .map { [weak self] in ViewRep(from: $0, cachingTo: self) }
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    
    @discardableResult
    func ingest(_ atomicOperation: AtomicOperation) throws -> Self {
        let (updatedState, updatedCache, externalActivities) = try atomicOperation.mutate(
            appState: appState,
            viewRepCache: viewRepCache)
        
        appState = updatedState
        viewRepCache = updatedCache
        
        appStateViewRepCachePublisher.send((updatedState, updatedCache))
        
        if !externalActivities.isEmpty {
            Task {
                externalActivities.forEach { (key, activity) in
                    let isCancellable = !key.hasPrefix(".")
                    if isCancellable {
                        cancellableTasks[key]?.cancel()
                    }
                    let task = activity(self)
                    if isCancellable {
                        cancellableTasks[key] = task
                    }
                }
            }
        }
        
        return self
    }
}
