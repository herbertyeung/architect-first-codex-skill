---
name: architect-first
description: Architecture-first development workflow for non-trivial software changes. Use when Codex is asked to design or implement a feature, refactor, module, API, UI, C++ component, or other change where architecture, file ownership, design patterns, tests, or responsibility boundaries matter; especially when the user says "architect-first", "design first", "do not write code yet", or "wait for approval".
---

# Architect First Development

## Purpose

Prevent direct one-file implementations for non-trivial changes. Design the architecture before editing code, then implement only after approval.

## Mandatory Workflow

For every non-trivial change:

1. Analyze requirements and constraints.
2. Inspect the relevant codebase structure before proposing changes.
3. Propose architecture, modules, files, responsibilities, and dependency direction.
4. Select design patterns only where they solve a concrete problem.
5. Present an implementation plan and testing plan.
6. Stop and wait for explicit approval before editing files.
7. After approval, implement incrementally.
8. Add or update focused tests.
9. Review the resulting architecture before final response.

For trivial changes, state why the change is trivial and proceed normally unless the user explicitly asked to stop before coding.

## Hard Rules

- Do not write code before architecture approval when this skill is explicitly requested for design-first work.
- Do not put unrelated responsibilities in one file.
- Do not create random helper functions to patch design problems.
- Do not create `util`, `utils`, `helpers`, or dumping-ground modules without a precise responsibility.
- Keep every file focused on one clear responsibility.
- Explain why each proposed class, module, or file exists.
- Prefer narrow, reversible implementation steps over broad rewrites.

Separate responsibilities across:

- domain logic
- application services
- infrastructure
- UI or API layer
- persistence
- tests

## Output Format Before Coding

Before editing files, output:

1. Proposed folder structure
2. Proposed files
3. Responsibility of each file
4. Main classes or modules
5. Dependency direction
6. Selected patterns
7. Testing plan
8. Risks and assumptions

Then stop and wait for approval.

## Pattern Selection

Before implementation, evaluate whether the feature needs:

- Strategy
- Adapter
- Factory
- Builder
- Command
- Observer
- State
- Repository
- Facade
- Dependency Injection

For each selected pattern, explain:

- why it is appropriate
- what alternative was considered
- why this is not overengineering

If no pattern is needed, say so and explain why simple composition or direct code is enough.

For deeper checks, read:

- `architecture-checklist.md` when proposing module boundaries.
- `pattern-guide.md` when selecting or rejecting design patterns.
- `review-checklist.md` before finalizing implementation.

## C++ Rules

Prefer:

- RAII
- smart pointers
- const correctness
- composition over inheritance
- explicit ownership
- small cohesive classes
- testable interfaces

Avoid:

- raw `new` or `delete`
- global state
- singleton by default
- god classes
- massive functions
- massive files
