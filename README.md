# Splendor Private Cloud (v3.8.1 Stable)

> **当前分支版本**: v3.8.1
> **最后更新**: 2026-01-21

## Release Notes (v3.8.1)
**状态**: 稳定版 (Stable)

### 核心特性 (Key Features)
- **本地对战 (Local Game)**: 支持 2-4 人本地多人对战 (Hotseat) 或与不同难度的 AI 对垒。
- **自定义配置**:
  - 目标分数 (Target Score): 动态设置胜利条件。
  - 回合限时 (Turn Duration): 支持从 10秒到无限时长的灵活配置。
- **游戏退出**: 支持游戏内实时退出并保存设置。

### 变更日志 (v3.8.0 - v3.8.1)
- [v3.8.1] 修复游戏结算逻辑；增加“回合时长”及“目标分数”选择器。
- [v3.8.0] 重构主菜单，分离本地游戏与线上游戏入口。

## 快速开始

### 客户端 (Client)
运行 `dist/v3.8.1-stable/Client/splendor_client.exe`。

### 服务端 (Server)
- **Windows**: 运行 `server.exe`。
- **Docker**: 通过 `dist` 目录中的 Docker 资源部署。
