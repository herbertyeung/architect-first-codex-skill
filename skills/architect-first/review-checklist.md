# Review Checklist

Use this checklist after implementation and before final response.

## Architecture

- Each file has one clear responsibility.
- Dependencies flow in the proposed direction.
- No new module cycles were introduced.
- No dumping-ground helper module was introduced.
- Selected patterns still have a concrete reason to exist.
- Simpler alternatives were not ignored.

## Implementation

- The implementation matches the approved plan or clearly explains any deviation.
- Ownership and lifetimes are explicit.
- Error handling follows local conventions.
- Public APIs are minimal and named consistently.
- Existing behavior outside the requested change is preserved.

## C++

- RAII is used for resource management.
- Raw ownership is avoided.
- Const correctness is maintained.
- Interfaces are testable without excessive mocking.
- Large functions or classes were split only where it improved cohesion.

## Tests

- Tests cover the behavior at the right layer.
- Regression tests exist for fixed bugs.
- Tests avoid depending on incidental implementation details.
- Verification commands were run, or skipped with a clear reason.
