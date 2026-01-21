---
name: verify_project
description: 运行全项目检查：Analysis, Tests, and Version Check
---

# Verify Project Skill

此 Skill 用于快速检查项目的健康状况，特别是在 Handover 或接收新任务前。

## 步骤

1.  **代码静态分析 (Analysis)**
    - 目录: `splendor_shared`
    - 命令: `flutter analyze`
    - 目录: `splendor_client`
    - 命令: `flutter analyze`
    - 目录: `splendor_server`
    - 命令: `flutter analyze`
    - **要求**: 必须为 0 errors。Warnings 可接受但应汇报。

2.  **单元测试 (Tests)**
    - 目录: `splendor_shared`
    - 命令: `flutter test`
    - **要求**: 所有核心逻辑测试必须通过。

3.  **版本一致性检查**
    - 读取 `splendor_shared/pubspec.yaml`, `splendor_client/pubspec.yaml`, `splendor_server/pubspec.yaml`。
    - 确保 `version` 字段一致。

## 使用示例 (Agent)

当用户要求 "检查代码"、"自检" 或 "准备提交" 时：

1.  按顺序执行上述检查。
2.  如果发现错误，停止并报告具体错误日志。
3.  如果全部通过，报告 "✅ Project Verified"。
