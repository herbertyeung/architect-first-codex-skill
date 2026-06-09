# Project AI Rules

Use the `architect-first` skill before implementing any non-trivial feature, refactor, module, API, UI, C++ component, or cross-file change.

Use the `production-engineering-review` skill for production-sensitive changes involving storage, networking, concurrency, configuration, migration, security, performance, build systems, deployment, or legacy behavior.

For every non-trivial change:

- design first
- propose files first
- explain responsibility boundaries
- explain pattern choices
- propose tests
- review production risks when relevant
- wait for approval before editing files when the user requested design-first work

Code quality has priority over speed.

Reject one-file implementations unless the task is truly trivial.
