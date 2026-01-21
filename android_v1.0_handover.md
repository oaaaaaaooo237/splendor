# Splendor 安卓版 (v1.0) 开发交接文档

## 1. 项目概述
本项目旨在将 Splendor 从 PC 端 (v3.8.1) 完整移植到 Android 平台。当前已完成 **Phase 1: 环境配置与基础构建**，并成功验证了构建链路。

## 2. 核心需求与设计 (Requirements)
- **功能一致性**：保持与 PC 版一致的全部功能，包括本地热座 (2-4人) 和在线大厅。
- **环境隔离**：
    - **Git 分支**：独立分支 `feature/android-v1.0-port`。
    - **包名**：`com.garyttl.splendor` (区别于默认包名)。
    - **版本号**：从 `1.0.0+1` 开始，与桌面版 (v3.8.x) 彻底解耦。
- **移动端适配**：
    - **强制横屏 (Landscape)**：已在 `AndroidManifest.xml` 中配置。
    - **触控优化**：替换所有 `MouseRegion` (悬停) 逻辑为长按或点击交互。
    - **系统集成**：拦截安卓返回键、处理生命周期 (Pause/Resume)。

## 3. 环境部署情况 (Environment)
- **代理配置**：
    - **地址**：`127.0.0.1:7890` (HTTP/HTTPS)。
    - **效果**：测试结果显示代理访问比直连快约 11 倍 (1s vs 11s)。后续 Gradle 构建建议保持开启。
- **工具链状况** (`flutter doctor` 验证通过)：
    - Flutter SDK: 3.38.5 (Stable)
    - Android toolchain: SDK 36.1.0 已就绪。
    - 可用设备：已识别到 3 个可用连接设备/模拟器。

## 4. 已完成进度 (Progress)
- [x] **Git 隔离**：创建并切换至安卓专用特性分支。
- [x] **包名重写**：`com.garyttl.splendor` 已在 `build.gradle.kts` 和 `AndroidManifest.xml` 中生效。
- [x] **版本重置**：`pubspec.yaml` 版本号更新为 `1.0.0+1`。
- [x] **横屏锁定**：已在主 Activity 中配置 `screenOrientation="landscape"`。
- [x] **构建验证**：成功生成第一个测试 APK `app-debug.apk`。

## 5. 后续开发规划 (Next Steps)
### Phase 2: UI/UX 移动端适配 (当前重点)
- **交互逻辑修改**：
    - 修改 `splendor_card_widget.dart`：移除 `MouseRegion`，添加 `GestureDetector` 实现长按放大预览。
    - 修改 `noble_widget.dart` 和 `noble_hover_widget.dart`。
- **界面微调**：
    - 检查小屏设备上的 UI 溢出 (Overflow)。
    - 针对触控放大点击区域 (Hit Box)。

### Phase 3: 系统深度集成
- **返回键拦截**：实现点击安卓物理返回键弹出游戏退出确认弹窗。
- **音频适配**：验证 `audioplayers` 在安卓端的延迟表现。

## 6. Agent Skills (自动化工具)
为了安卓开发的高效性，本项目集成了以下 Skills：
- **`build_android` (新)**：专门为 Android 1.0 编写的构建脚本。
  - 功能：自动执行 `flutter build apk --debug`，并将产物归档。
- **`start_feature_branch`**：用于标准化开启安卓特性的 Git 分支。
  - 已使用：创建了 `feature/android-v1.0-port` 分支。
- **`verify_project`**：项目健康检查工具。
  - 建议：在提交代码或开始 UI 适配前运行，确保跨平台逻辑无 Error。

## 7. 开发者须知
- **代理使用**：在终端执行构建前，请确保执行 `$env:HTTP_PROXY="http://127.0.0.1:7890"`。
- **文档参考 (持久化)**：
    - [实施计划](file:///d:/python%20programs/GaryTTL/Splendor/android_v1.0_implementation_plan.md)
    - [详细任务列表](file:///d:/python%20programs/GaryTTL/Splendor/android_v1.0_task.md)
