# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Brotherhood Alchemist is a SwiftUI iOS app for finding Skyrim alchemy recipes. It computes all valid 2- and 3-ingredient potion/poison combinations (~33,682 mixtures) from 92 ingredients and 53 effects.

The `state-machine` branch is an active rewrite from the legacy architecture to an actor-based state machine. The SwiftUI views have been reconnected to the new state machine.

## Build & Test Commands

```bash
# Build DomainLogic framework
xcodebuild build -project "Brotherhood Alchemist.xcodeproj" -scheme "DomainLogic" -destination "platform=iOS Simulator,name=iPhone 16 Pro"

# Run DomainLogic tests (primary test suite)
xcodebuild test -project "Brotherhood Alchemist.xcodeproj" -scheme "DomainLogic" -destination "platform=iOS Simulator,name=iPhone 16 Pro"

# Build full app
xcodebuild build -project "Brotherhood Alchemist.xcodeproj" -scheme "Brotherhood Alchemist" -destination "platform=iOS Simulator,name=iPhone 16 Pro"

# Run a single test
xcodebuild test -project "Brotherhood Alchemist.xcodeproj" -scheme "DomainLogic" -destination "platform=iOS Simulator,name=iPhone 16 Pro" -only-testing:"DomainLogicTests/DomainLogicTests/testMethodName"
```

## Linting

SwiftLint is configured (`.swiftlint.yml`): line length 180, `function_body_length` and `type_body_length` disabled.

## Architecture

### State Machine Pattern

The core is `StateMachine` — a Swift `actor` that holds `AppState` and `ViewRepCache`. All mutations flow through:

1. **Intents** (user actions) and **ExternalEvents** (async results) both conform to `AtomicOperation`
2. `AtomicOperation.mutate(appState:viewRepCache:)` returns `(AppState, ViewRepCache, [String: ExternalActivity])`
3. The state machine ingests operations, applies mutations, and spawns returned activities as cancellable `Task`s
4. State changes publish through Combine (`PassthroughSubject` → deduplication → main queue)

### Key Types

- **`AppState`** — Immutable value type holding all domain data: effects, ingredients, mixtures, filter constraints (mustHave/cantHave sets), mixing mode
- **`ViewRep`** — View-optimized representation derived from `(AppState, ViewRepCache)`. Equatable for deduplication. Contains sorted, display-ready ingredient/effect/mixture arrays
- **`ViewRepCache`** — Caches expensive ViewRep computations using `Cache<T>` enum (`.cached(T)` / `.invalidated(UUID)`). UUID-based staleness detection prevents stale async updates from overwriting newer data
- **`SelectionState`** — `.mustHave` / `.cantHave` / `.mayHave` enum for ingredient/effect filter constraints

### Intent & ExternalEvent Conventions

All intents live under the `Intent` namespace enum, one per file (`Intent.AddEffect.swift`, etc.). Pattern:
1. Validate preconditions against current state (throw on failure)
2. Create mutated copies of `AppState` and `ViewRepCache`
3. Return activities dict — e.g., `MixtureIdentifier.identificationActivity()` after data changes, `MixtureFilter.filterActivity()` after filter changes

ExternalEvents follow the same `AtomicOperation` protocol but arrive from background tasks. They validate revision numbers / UUID references before applying, discarding stale results.

### Background Processing

- **`MixtureIdentifier`** — Finds all valid mixtures using optimized combinatorial search with `UnsafeBufferPointer` for performance. Supports cooperative cancellation via `Task.checkCancellation()`. Reports progress via `ExternalEvent.MixtureIdentificationProgress`
- **`MixtureFilter`** — Actor that filters mixtures by constraints and mixing mode (`.septimExtorsion` = all, `.inflictingPain` = negative effects, `.exploration` = positive effects)
- **`PotionCalculator`** — Computes magnitude, duration, and gold value per effect using Skyrim alchemy formulas (power factor 6.0, level 100 Alchemy, no perks). Uses per-ingredient effect multipliers from `IngredientEffectMultiplier`

### Cancellable Task Management

The state machine tracks tasks by string key. Ingesting a new activity with the same key cancels the previous task. Keys starting with `"."` are fire-and-forget (not tracked).

### Data Loading

Static data lives in `Effect.all` and `Ingredient.all` (predefined arrays with 60 effects and 92 Skyrim Anniversary Edition ingredients). The app boots via `Intent.LoadAllData`, which populates `AppState` and triggers `MixtureIdentifier` to compute all valid combinations.

### SwiftUI App Layer

- **`AppViewModel`** — `@MainActor ObservableObject` that owns the `StateMachine`, subscribes to `ViewRep` updates, and exposes actions (loadData, toggleSelection, resetAll)
- **Layout** — iPad uses a 3-column split (Ingredients | Recipes | Effects); iPhone uses tab-based navigation
- **Selection flow** — Tapping an ingredient/effect cycles through `mayHave` → `mustHave` → `cantHave` → `mayHave`, dispatching the corresponding Intent

## Concurrency Model

- `StateMachine` and `MixtureFilter` are actors — all state access is serialized
- All data model types and operations are `Sendable`
- `@MainActor` is used for `SelectionStatePublisher` and SwiftUI views
- Strict concurrency checking is being adopted (`SWIFT_STRICT_CONCURRENCY = complete`)

## Testing Patterns

Tests are in `DomainLogicTests/DomainLogicTests.swift`. All tests are `async throws`. Each test creates a fresh `StateMachine()`. Intents are chained: `try await stateMachine.ingest(Intent.X(...)).ingest(Intent.Y(...))`. Async assertions use `XCTestExpectation` + Combine sinks with `fulfillment(of:timeout:)`.

## ID Generation

Effect and Ingredient IDs are hex-formatted `Int64` values. The `genid` target is a macOS CLI that generates new random IDs for adding new effects/ingredients to the static data.

## Targets

| Target | Type | Platform |
|--------|------|----------|
| `Brotherhood Alchemist` | SwiftUI App | iOS 15.0+ |
| `DomainLogic` | Framework | iOS 16.4+ |
| `DomainLogicTests` | Test Bundle | iOS 16.4+ |
| `genid` | CLI Tool | macOS 13.3+ |

Dependencies: `swift-algorithms` 1.0.0, `swift-numerics` 1.0.2
