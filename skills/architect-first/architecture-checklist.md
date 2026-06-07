# Architecture Checklist

Use this checklist before proposing files or modules.

## Requirement Boundary

- Identify the user-visible behavior.
- Identify what must not change.
- Identify existing conventions, ownership boundaries, and entry points.
- Identify whether the change is feature work, refactor, bug fix, API change, UI change, or infrastructure work.

## Responsibility Boundary

- Keep domain rules independent from UI, persistence, transport, and framework concerns.
- Keep application services focused on orchestration.
- Keep infrastructure code behind explicit interfaces when it is volatile or hard to test.
- Keep UI or API layers thin and predictable.
- Keep tests aligned with the layer being tested.

## File Proposal

For each proposed file, state:

- why the file exists
- what it owns
- what it must not own
- who depends on it
- what tests cover it

Reject a proposed file when it only exists to collect unrelated helper functions.

## Dependency Direction

Prefer dependencies flowing inward:

- UI or API depends on application services.
- Application services depend on domain abstractions.
- Infrastructure implements abstractions.
- Tests may depend on all layers, but should not force production design into test-only shapes.

Avoid cycles between modules. If a cycle appears, introduce a clearer boundary or invert the dependency.
