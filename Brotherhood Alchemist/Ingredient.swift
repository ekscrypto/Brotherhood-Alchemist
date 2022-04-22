//
//  Ingredient.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import UIKit

class Ingredient: Identifiable, Equatable, Codable {
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: UUID = .init()
    @Published var effects: [EffectRef] {
        willSet {
            updateEffectAssociations(currentEffects: effects, newEffects: newValue)
        }
    }
    @Published var name: ConstrainedName
    @Published var selection: SelectionState = .mayHave
    
    class EffectRef {
        weak var ref: Effect?
        
        init(_ effect: Effect) {
            ref = effect
        }
    }
    
    enum Errors: Error {
        case tooManyEffects
        case repeatingEffects
    }
    static let maximumEffects: Int = 4
    
    enum CodingKeys: CodingKey {
        case effects
        case name
    }
    
    private func updateEffectAssociations(currentEffects currentRef: [EffectRef], newEffects newRef: [EffectRef]) {
        let currentEffects = currentRef.compactMap { $0.ref }
        let newEffects = newRef.compactMap { $0.ref }
        for currentEffect in currentEffects where false == newEffects.contains(currentEffect) {
            currentEffect.ingredients.removeAll(where: { $0.ref == self })
        }
        for newEffect in newEffects where false == currentEffects.contains(newEffect) {
            if false == newEffect.ingredients.contains(where: { $0.ref == self}) {
                newEffect.ingredients.append(.init(self))
            }
        }
    }
    
    init?(name providedName: ConstrainedName, effects providedEffects: [Effect] ) {
        name = providedName
        let matchedEffects: [Effect] = providedEffects.compactMap { Effects.registry.effect(named: $0.name) }
        guard let uniqueEffects = try? Self.uniqueEffectsWithinBounds(matchedEffects) else {
            return nil
        }
        effects = uniqueEffects.map { .init($0) }
        uniqueEffects.forEach { $0.ingredients.append(.init(self)) }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(ConstrainedName.self, forKey: .name)
        let effectsName: [ConstrainedName] = try container.decode([ConstrainedName].self, forKey: .effects)
        let matchedEffects: [Effect] = effectsName.compactMap { Effects.registry.effect(named: $0) }
        let uniqueEffects: [Effect] = try Self.uniqueEffectsWithinBounds(matchedEffects)
        effects = uniqueEffects.map { .init($0) }
        uniqueEffects.forEach { $0.ingredients.append(.init(self)) }
    }
    
    deinit {
        updateEffectAssociations(currentEffects: effects, newEffects: [])
        effects.forEach { $0.ref?.removeIngredientsNilRefs() }
    }
        
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let effectNames: [ConstrainedName] = effects.compactMap { $0.ref?.name }
        try container.encode(effectNames, forKey: .effects)
        try container.encode(name, forKey: .name)
    }
    
    static func uniqueEffectsWithinBounds(_ effects: [Effect]) throws -> [Effect] {
        guard effects.count <= Self.maximumEffects else {
            throw Errors.tooManyEffects
        }
        guard Set(effects.map({$0.id})).count == effects.count else {
            throw Errors.repeatingEffects
        }
        return effects
    }
}
