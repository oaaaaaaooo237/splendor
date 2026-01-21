---
name: start_feature_branch
description: 标准化开启新特性分支流程
---

# Start Feature Branch Skill

此 Skill 用于规范化新任务的开始流程，确保 Git 分支管理整洁。

## 步骤

1.  **检查当前状态**
    - 命令: `git status`
    - **要求**: 工作区应该是干净的 (clean)，或者只有不影响切换的未追踪文件。如果不仅净，提示用户 stash 或 commit。

2.  **更新主分支 (可选)**
    - 如果在 `master` 或 `main`，建议先 `git pull`。

3.  **创建新分支**
    - 命名规范: `feature/<name>` (功能), `fix/<name>` (修复), `release/<name>` (发布).
    - 命令: `git checkout -b <branch_name>`

4.  **初始化任务**
    - 自动在 `task.md` 中添加新任务头，或重置任务状态。

## 使用示例 (Agent)

当用户说 "开始做 v3.8 本地游戏" 或 "修复 xxx bug" 时：

1.  构思一个简短的分支名 (如 `feature/local-game-setup`).
2.  执行 `git status` 检查。
3.  执行 `git checkout -b feature/local-game-setup`.
4.  通知用户已切换分支，准备开始。
