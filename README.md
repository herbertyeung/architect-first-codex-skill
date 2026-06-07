# Architect First Codex Skill

An unofficial community skill pack for Codex CLI and Codex Desktop that guides agents to design architecture, file boundaries, patterns, and tests before implementation.

This skill is useful when you want Codex to slow down before coding: inspect the codebase, propose the module structure, explain responsibilities, choose design patterns only when they help, and wait for approval before editing files.

This project is not affiliated with, endorsed by, or maintained by OpenAI.

## What It Does

- Forces architecture-first thinking for non-trivial changes.
- Prevents one-file implementations and dumping-ground helper modules.
- Separates domain logic, application services, infrastructure, UI/API, persistence, and tests.
- Adds a required pre-coding output format.
- Includes checklists for architecture, pattern selection, and final review.
- Adds C++-friendly guidance for RAII, ownership, const correctness, and cohesive classes.

## Repository Structure

```text
architect-first-codex-skill/
├── AGENTS.example.md
├── install.ps1
├── LICENSE
├── README.md
└── skills/
    └── architect-first/
        ├── SKILL.md
        ├── architecture-checklist.md
        ├── pattern-guide.md
        ├── review-checklist.md
        └── agents/
            └── openai.yaml
```

## Installation

### Windows PowerShell

From the repository root:

```powershell
.\install.ps1
```

By default, the script installs the skill to:

```text
%USERPROFILE%\.codex\skills\architect-first
```

To install to a custom Codex home:

```powershell
.\install.ps1 -CodexHome "D:\path\to\.codex"
```

### Manual Install

Copy the skill folder:

```text
skills/architect-first
```

to:

```text
~/.codex/skills/architect-first
```

If you want project-level guidance, copy the relevant text from `AGENTS.example.md` into your project `AGENTS.md`.

## Usage

Use it explicitly in a Codex prompt:

```text
Use architect-first.

Design this feature first. Do not edit files yet.

Feature:
...
```

Or:

```text
Use architect-first.

You are not allowed to edit files in this turn.
Only analyze the codebase and propose architecture.
```

## Expected Pre-Coding Output

Before editing files, Codex should output:

1. Proposed folder structure
2. Proposed files
3. Responsibility of each file
4. Main classes or modules
5. Dependency direction
6. Selected patterns
7. Testing plan
8. Risks and assumptions

Then it should stop and wait for approval.

## License

MIT License.

---

# Architect First Codex Skill 中文说明

这是一个非官方的社区版 Codex CLI / Codex Desktop Skill Pack，用来引导 Codex 在写代码之前先做架构设计、文件边界划分、设计模式选择和测试计划。

它适合你希望 Codex 不要一上来就把代码塞进一个文件的场景：先阅读代码结构，再提出模块拆分，说明每个文件的职责，只在真正有帮助时选择设计模式，并在编辑文件前等待确认。

本项目不是 OpenAI 官方项目，也未由 OpenAI 维护或背书。

## 它解决什么问题

- 让非平凡改动先设计、后实现。
- 避免单文件实现和 `utils` / `helpers` 这类职责不清的垃圾桶模块。
- 区分领域逻辑、应用服务、基础设施、UI/API、持久化和测试。
- 要求 Codex 在编码前输出固定的架构方案。
- 提供架构检查、设计模式选择和最终评审清单。
- 对 C++ 项目特别强调 RAII、所有权、const correctness 和小而内聚的类。

## 安装方式

### Windows PowerShell

在仓库根目录运行：

```powershell
.\install.ps1
```

默认会安装到：

```text
%USERPROFILE%\.codex\skills\architect-first
```

如果你想指定 Codex home：

```powershell
.\install.ps1 -CodexHome "D:\path\to\.codex"
```

### 手动安装

把这个目录：

```text
skills/architect-first
```

复制到：

```text
~/.codex/skills/architect-first
```

如果你希望项目级别也强制启用这套规则，可以把 `AGENTS.example.md` 里的相关内容复制到项目根目录的 `AGENTS.md`。

## 使用方式

在 Codex 里显式说明：

```text
Use architect-first.

Design this feature first. Do not edit files yet.

Feature:
...
```

也可以更强一点：

```text
Use architect-first.

You are not allowed to edit files in this turn.
Only analyze the codebase and propose architecture.
```

## 编码前应输出什么

在编辑文件之前，Codex 应该先输出：

1. 建议的目录结构
2. 建议新增或修改的文件
3. 每个文件的职责
4. 主要类或模块
5. 依赖方向
6. 选择的设计模式
7. 测试计划
8. 风险和假设

然后停止，等待你的确认。
