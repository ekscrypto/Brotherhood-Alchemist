//
//  SelectionState.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-25.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation
import Combine

public enum SelectionState: Equatable, Sendable {
    case mustHave
    case cantHave
    case mayHave
}

@MainActor
public final class SelectionStatePublisher: Sendable {
    public let publisher = PassthroughSubject<SelectionState, Never>()
        .receive(on: DispatchQueue.main)
        .subscribe(on: DispatchQueue.main)
    
    nonisolated init() {}
}

final class SelectionStatePublisherCache {
    private static var ingredientSelectionPublishers: [Ingredient.Id: SelectionStatePublisher] = [:]
    static func viewRepPublisher(for ingredient: Ingredient.Id) -> SelectionStatePublisher {
        if let publisher = ingredientSelectionPublishers[ingredient] {
            return publisher
        }
        let publisher = SelectionStatePublisher()
        ingredientSelectionPublishers[ingredient] = publisher
        return publisher
    }
    
    private static var effectSelectionPublishers: [Effect.Id: SelectionStatePublisher] = [:]
    static func viewRepPublisher(for effect: Effect.Id) -> SelectionStatePublisher {
        if let publisher = effectSelectionPublishers[effect] {
            return publisher
        }
        let publisher = SelectionStatePublisher()
        effectSelectionPublishers[effect] = publisher
        return publisher
    }
}
