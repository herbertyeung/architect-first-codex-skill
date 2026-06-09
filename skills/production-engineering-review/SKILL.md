---
name: production-engineering-review
description: Production-readiness review workflow for non-trivial software changes. Use when Codex is asked to design, review, or implement changes involving architecture, storage, networking, concurrency, configuration, migration, security, performance, build systems, deployment, legacy behavior, failure handling, rollback strategy, or other production risk.
---

# Production Engineering Review Skill

Use this skill for any non-trivial software change, especially changes involving architecture, storage, networking, concurrency, configuration, migration, security, performance, build systems, deployment, or legacy behavior.

The goal is not only to make the code work, but to make the change production-ready.

## Mandatory Rule

Do not start coding immediately.

Before implementation, produce:

1. Problem understanding
2. Production risk checklist
3. Design options
4. Selected design and tradeoffs
5. Test matrix
6. Implementation plan
7. Rollback or failure strategy if relevant

Only after this review should implementation begin.

## Core Principle

A change is not complete just because the happy path works.

A change is complete only when correctness, failure behavior, performance, compatibility, observability, and maintainability have been considered and tested.

## Step 1: Understand the Change

Before coding, restate:

- What problem is being solved
- What behavior must remain unchanged
- What behavior is intentionally changed
- What existing assumptions may be invalidated
- Which components are affected
- Which users, operators, or downstream systems may be affected

If any requirement is unclear, make a reasonable assumption and state it explicitly.

## Step 2: Production Risk Checklist

Review every category below. If a category is not applicable, say why.

### Correctness

- Can the new code produce incorrect results?
- Are edge cases handled?
- Are invalid inputs handled?
- Are partial failures handled?
- Are invariants clearly preserved?
- Are error codes, exceptions, and return values checked?
- Can the system enter an inconsistent state?

### Concurrency

- Is mutable state shared across threads?
- Is ownership clear?
- Are locks needed?
- Are locks held for too long?
- Is there any deadlock risk?
- Is there any race during startup or shutdown?
- Are callbacks or event handlers reentrant?
- Are third-party APIs thread-safe under this usage?

### Performance

- Is any hot path slowed down?
- Are blocking operations introduced?
- Are disk, network, database, or logging calls added to latency-sensitive paths?
- Is batching needed?
- Is memory usage bounded?
- Is there any unbounded queue, cache, retry loop, or recursion?
- Are algorithmic complexities acceptable?

### Durability and State

- When is data considered persisted?
- What can be lost on crash?
- Is shutdown flush required?
- Are low-frequency events handled?
- Is partial write failure handled?
- Are transactions or atomic updates needed?
- Can data be duplicated, skipped, reordered, or corrupted?

### Configuration

- What happens if configuration is missing, invalid, or inconsistent?
- Should the system fail fast?
- Is silent fallback allowed?
- Are feature flags safe?
- Are stub or future options exposed as working options?
- Are operator-facing errors actionable?

### Compatibility

- Does this preserve existing behavior?
- Does this preserve file formats, APIs, protocols, schemas, or UI-visible semantics?
- Is backward compatibility required?
- Is forward compatibility required?
- Are old data and old configurations still supported?
- Is migration needed?

### Migration and Reload

- Can old data be imported correctly?
- After restart, does the system behave the same?
- Is round-trip behavior tested?
- What happens on partial migration failure?
- Is rollback possible?
- Are directory iteration, parsing, permissions, and corrupted data handled?

### Cross Platform and Build

- Does this work on all supported platforms?
- Are platform-specific APIs guarded?
- Are path encodings handled correctly?
- Are CMake, linker, runtime library, and packaging changes correct?
- Are debug and release builds both considered?
- Are CI environments covered?

### Security

- Is any user input trusted incorrectly?
- Is authentication or authorization affected?
- Are secrets logged?
- Are file paths validated?
- Is there path traversal risk?
- Are dependencies safe and necessary?
- Are permissions least-privilege?

### Observability

- Are important failures logged?
- Are logs actionable and not too noisy?
- Are metrics or counters needed?
- Can operators tell which backend, mode, or feature path is active?
- Can failures be diagnosed after deployment?
- Are silent failures avoided?

### Maintainability

- Is responsibility split clearly?
- Are names accurate?
- Is ownership obvious?
- Is the code testable?
- Is the design over-engineered?
- Is the design under-specified?
- Are comments used only for non-obvious behavior?
- Is legacy code isolated from new logic?

## Step 3: Design Options

Before choosing an implementation, provide at least two options when meaningful.

For each option, include:

- Description
- Pros
- Cons
- Failure modes
- Complexity
- Testability
- Operational risk

Then choose one option and explain why.

## Step 4: Define Semantics

For changes involving state, concurrency, IO, networking, or configuration, explicitly define:

- Success behavior
- Failure behavior
- Startup behavior
- Shutdown behavior
- Retry behavior
- Timeout behavior
- Persistence behavior
- Compatibility behavior
- Fallback behavior
- User-visible behavior
- Operator-visible behavior

Do not leave these implicit.

## Step 5: Test Matrix

Before implementation, create a test matrix.

Each test must map to a production risk.

Minimum test categories:

- Happy path tests
- Error path tests
- Boundary tests
- Invalid input tests
- Regression tests
- Compatibility tests
- Restart or reload tests when state is involved
- Concurrency tests when shared state is involved
- Failure injection tests when IO, database, network, or config is involved
- Cross-platform build or compile guard tests when platform-specific code is involved

Use this format:

| Risk | Test | Expected Result |
| ---- | ---- | --------------- |

Do not rely only on happy-path unit tests.

## Step 6: Implementation Rules

During implementation:

- Keep changes small and reviewable.
- Avoid mixing refactor and behavior change unless necessary.
- Preserve existing behavior unless explicitly changed.
- Make ownership and lifetime explicit.
- Check errors from external APIs.
- Avoid silent fallback.
- Avoid exposing non-working options.
- Avoid blocking hot paths.
- Avoid global mutable state unless strongly justified.
- Add tests with the change.
- Keep logs useful and actionable.
- Prefer simple designs over clever designs.

## Step 7: Self Review Before Completion

After implementation, perform a hostile review of the change.

Answer these questions:

- What can still break in production?
- What can corrupt data?
- What can lose data?
- What can slow down the hot path?
- What can fail only after restart?
- What can fail only under concurrency?
- What can fail only on another platform?
- What can silently misconfigure the system?
- What legacy behavior may have changed accidentally?
- What tests are still missing?
- What assumptions remain unverified?

If any risk remains, report it explicitly.

Do not claim the task is complete if important risks are unresolved.

## Final Response Format

When reporting completion, include:

1. Summary of changes
2. Files changed
3. Tests added or updated
4. Tests run
5. Production risks reviewed
6. Known limitations or remaining risks
7. Suggested follow-up work

Never say "done" without explaining what was verified.
