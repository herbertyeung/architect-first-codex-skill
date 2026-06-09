# Architect First Codex Skill Pack

An unofficial community skill pack for Codex CLI and Codex Desktop that guides agents to design architecture, review production risks, define tests, and wait for approval before implementation.

This pack is useful when you want Codex to slow down before coding: inspect the codebase, propose module structure, explain responsibilities, choose design patterns only when they help, review production readiness, and avoid treating the happy path as "done."

This project is not affiliated with, endorsed by, or maintained by OpenAI.

## Included Skills

### architect-first

Use this skill when architecture, file ownership, dependency direction, design patterns, and test planning matter.

It helps Codex:

- Design before coding.
- Propose folders and files first.
- Explain each file's responsibility.
- Avoid one-file implementations and dumping-ground helper modules.
- Separate domain logic, application services, infrastructure, UI/API, persistence, and tests.
- Use C++-friendly practices such as RAII, explicit ownership, const correctness, and cohesive classes.

### production-engineering-review

Use this skill for production-sensitive changes involving architecture, storage, networking, concurrency, configuration, migration, security, performance, build systems, deployment, or legacy behavior.

It helps Codex review:

- Correctness and edge cases
- Concurrency and ownership
- Performance and hot paths
- Durability and state
- Configuration behavior
- Compatibility and migration
- Cross-platform and build impact
- Security
- Observability
- Maintainability
- Test matrix coverage
- Rollback or failure strategy

## Repository Structure

```text
architect-first-codex-skill/
├── AGENTS.example.md
├── install.ps1
├── LICENSE
├── README.md
└── skills/
    ├── architect-first/
    │   ├── SKILL.md
    │   ├── architecture-checklist.md
    │   ├── pattern-guide.md
    │   ├── review-checklist.md
    │   └── agents/
    │       └── openai.yaml
    └── production-engineering-review/
        ├── SKILL.md
        └── agents/
            └── openai.yaml
```

## Installation

### Windows PowerShell

From the repository root:

```powershell
.\install.ps1
```

By default, the script installs all included skills to:

```text
%USERPROFILE%\.codex\skills\
```

To install to a custom Codex home:

```powershell
.\install.ps1 -CodexHome "D:\path\to\.codex"
```

### Manual Install

Copy the folders under:

```text
skills/
```

to:

```text
~/.codex/skills/
```

If you want project-level guidance, copy the relevant text from `AGENTS.example.md` into your project `AGENTS.md`.

## Usage

For architecture-first design:

```text
Use architect-first.

Design this feature first. Do not edit files yet.

Feature:
...
```

For production-readiness review:

```text
Use production-engineering-review.

Review the production risks, design options, test matrix, and rollback strategy before implementation.

Change:
...
```

You can also combine them:

```text
Use architect-first and production-engineering-review.

You are not allowed to edit files in this turn.
Only analyze the codebase, propose architecture, review production risks, and produce a test matrix.
```

## Expected Pre-Coding Output

For architecture-first work, Codex should output:

1. Proposed folder structure
2. Proposed files
3. Responsibility of each file
4. Main classes or modules
5. Dependency direction
6. Selected patterns
7. Testing plan
8. Risks and assumptions

For production-sensitive work, Codex should also output:

1. Problem understanding
2. Production risk checklist
3. Design options
4. Selected design and tradeoffs
5. Test matrix
6. Implementation plan
7. Rollback or failure strategy if relevant

Then it should stop and wait for approval when design-first work was requested.

## License

MIT License.

---

# Architect First Codex Skill Pack 中文说明

这是一个非官方的社区版 Codex CLI / Codex Desktop Skill Pack，用来引导 Codex 在写代码之前先做架构设计、生产风险评审、测试计划和实现确认。

它适合你希望 Codex 不要一上来就把代码塞进一个文件的场景：先阅读代码结构，再提出模块拆分，说明每个文件的职责，只在真正有帮助时选择设计模式，同时检查生产环境风险，避免只跑通 happy path 就声称完成。

本项目不是 OpenAI 官方项目，也未由 OpenAI 维护或背书。

## 包含的 Skills

### architect-first

当架构设计、文件职责、依赖方向、设计模式和测试计划很重要时，使用这个 skill。

它会要求 Codex：

- 先设计，再编码。
- 先提出目录和文件拆分。
- 说明每个文件的职责。
- 避免单文件实现和 `utils` / `helpers` 这类职责不清的垃圾桶模块。
- 区分领域逻辑、应用服务、基础设施、UI/API、持久化和测试。
- 对 C++ 项目强调 RAII、显式所有权、const correctness 和小而内聚的类。

### production-engineering-review

当改动涉及架构、存储、网络、并发、配置、迁移、安全、性能、构建系统、部署或遗留行为时，使用这个 skill。

它会要求 Codex 检查：

- 正确性和边界情况
- 并发和所有权
- 性能和 hot path
- 持久化和状态
- 配置行为
- 兼容性和迁移
- 跨平台和构建影响
- 安全性
- 可观测性
- 可维护性
- 测试矩阵覆盖
- 回滚或失败策略

## 安装方式

### Windows PowerShell

在仓库根目录运行：

```powershell
.\install.ps1
```

默认会把所有 skills 安装到：

```text
%USERPROFILE%\.codex\skills\
```

如果你想指定 Codex home：

```powershell
.\install.ps1 -CodexHome "D:\path\to\.codex"
```

### 手动安装

把这个目录下面的所有 skill 文件夹：

```text
skills/
```

复制到：

```text
~/.codex/skills/
```

如果你希望项目级别也强制启用这套规则，可以把 `AGENTS.example.md` 里的相关内容复制到项目根目录的 `AGENTS.md`。

## 使用方式

架构优先设计：

```text
Use architect-first.

Design this feature first. Do not edit files yet.

Feature:
...
```

生产风险评审：

```text
Use production-engineering-review.

Review the production risks, design options, test matrix, and rollback strategy before implementation.

Change:
...
```

也可以组合使用：

```text
Use architect-first and production-engineering-review.

You are not allowed to edit files in this turn.
Only analyze the codebase, propose architecture, review production risks, and produce a test matrix.
```

## 编码前应输出什么

架构优先工作中，Codex 应该先输出：

1. 建议的目录结构
2. 建议新增或修改的文件
3. 每个文件的职责
4. 主要类或模块
5. 依赖方向
6. 选择的设计模式
7. 测试计划
8. 风险和假设

生产敏感改动中，Codex 还应该输出：

1. 问题理解
2. 生产风险清单
3. 设计选项
4. 选定方案和取舍
5. 测试矩阵
6. 实现计划
7. 相关的回滚或失败策略

然后在用户要求 design-first 时停止，等待确认。
