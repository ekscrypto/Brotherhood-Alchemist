//
//  ViewRep.Effect.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-24.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public extension ViewRep {
    struct Effect: Identifiable, Equatable, Sendable {
        public static func ==(lhs: Effect, rhs: Effect) -> Bool {
            lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.value == rhs.value &&
            lhs.isPositiveOutcome == rhs.isPositiveOutcome
        }

        public let id: DomainLogic.Effect.Id
        public let name: String
        public let value: UInt
        public let isPositiveOutcome: Bool
        public let selection: SelectionStatePublisher

        init(
            from effect: DomainLogic.Effect
        ) {
            id = effect.id
            name = effect.name
            value = effect.baseValue.rawValue
            isPositiveOutcome = effect.outcome == .positive
            selection = SelectionStatePublisherCache.viewRepPublisher(for: effect.id)
        }
    }
}
