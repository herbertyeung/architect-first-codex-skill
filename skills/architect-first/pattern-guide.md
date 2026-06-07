# Pattern Guide

Use patterns only when they reduce concrete complexity.

## Selection Questions

- What behavior varies?
- What dependency is volatile?
- What decision needs to be isolated?
- What coupling would make tests or future changes harder?
- Would a named pattern make the code simpler, or only more formal?

## Common Patterns

### Strategy

Use when an algorithm or policy varies and callers should not branch on every variant.

Avoid when there is only one stable behavior.

### Adapter

Use when integrating an external API, legacy interface, or incompatible dependency.

Avoid when the dependency already exposes the shape the application needs.

### Factory

Use when object construction has meaningful branching, dependency assembly, or invariants.

Avoid when constructors are simple and direct.

### Builder

Use when constructing complex immutable objects with many optional parts.

Avoid when named parameters or a simple config object are enough.

### Command

Use when an action must be queued, retried, logged, undone, or handled uniformly.

Avoid when the operation is a direct method call with no lifecycle.

### Observer

Use when multiple independent consumers must react to events.

Avoid when a direct callback or return value is clearer.

### State

Use when behavior changes by lifecycle state and conditional logic is spreading.

Avoid when the state machine is small and local.

### Repository

Use when persistence access needs a domain-facing abstraction.

Avoid when the code is a thin one-off query with no domain boundary.

### Facade

Use when simplifying a complex subsystem behind a stable entry point.

Avoid when it only hides one or two direct calls.

### Dependency Injection

Use when dependencies are volatile, expensive, external, or need test doubles.

Avoid when injecting stable value objects or creating ceremony without a testing or boundary benefit.
