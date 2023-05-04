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
    func mutate(appState: AppState, viewRepCache: ViewRepCache) throws -> (AppState, ViewRepCache, [ExternalActivity])
}

public typealias ExternalActivity = (StateMachine) -> Void

public actor StateMachine {
    public static var `default`: StateMachine {
        .init()
    }
    
    private(set) var appState: AppState = .initial
    private(set) var viewRepCache: ViewRepCache = .invalidated
    
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
            Task.detached {
                externalActivities.forEach { activity in
                    activity(self)
                }
            }
        }
        
        return self
    }
}
