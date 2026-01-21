---
name: build_release
description: 自动化构建 Splendor Client 和 Server 并打包到 dist 目录 (v3.8+)
---

# Build Release Skill

此 Skill 用于自动化构建 Splendor 的发布版本。

## 步骤

1.  **准备环境**
    - 确保当前没有正在运行的 Client 或 Server 进程占用文件。
    - 确认 `pubspec.yaml` 中的版本号已更新。

2.  **构建 Server**
    - 目录: `splendor_server`
    - 命令: `dart compile exe bin/main.dart -o ../dist/{version}/server/splendor_server.exe`
    - 注意: 如果 `dist/{version}` 不存在，需要先创建。

3.  **构建 Client (Windows)**
    - 目录: `splendor_client`
    - 命令: `flutter build windows --release`
    - 操作: 将 `build/windows/x64/runner/Release` 下的所有文件复制到 `dist/{version}/client/`。

4.  **生成说明文件**
    - 在 `dist/{version}/` 下创建 `README.txt`，包含当次构建的 commit hash 和时间。

## 使用示例 (Agent)

当用户要求 "打包" 或 "发布新版本" 时：

1.  询问用户目标版本号 (如 `v3.8-beta`).
2.  检查 `splendor_shared/pubspec.yaml` 版本是否匹配.
3.  执行上述构建命令.
4.  报告构建结果和 `dist` 目录路径.
