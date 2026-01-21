# Splendor 安卓版 (v1.0) 实施计划

将 Splendor 游戏 from PC 端移植到 Android 平台，重点在于移动端 UI 适配、触控交互优化以及安卓系统的兼容性。

## 拟进行的更改

### 1. 环境配置与项目设置 [Phase 1]
针对安卓构建配置项目，并定义基础平台元数据。

#### [修改] [AndroidManifest.xml](file:///d:/python%20programs/GaryTTL/Splendor/splendor_client/android/app/src/main/AndroidManifest.xml)
- 设置应用程序标签（Label）和图标。
- 请求必要权限（在线游戏所需的 Internet 权限）。
- 开启硬件加速并锁定屏幕方向。

#### [修改] [build.gradle.kts](file:///d:/python%20programs/GaryTTL/Splendor/splendor_client/android/app/build.gradle.kts)
- 更新 `namespace` 和 `applicationId` 为发布版本字符串（例如 `com.garyttl.splendor`）。
- 确保签名配置（Signing Config）已为发布准备就绪。

### 2. UI 与屏幕方向适配 [Phase 2]
使游戏界面适配小型触摸屏和横屏模式。

#### [修改] [welcome_page.dart](file:///d:/python%20programs/GaryTTL/Splendor/splendor_client/lib/ui/welcome/welcome_page.dart)
- 针对手机屏幕调整字体大小和布局约束。
- 确保布局在横屏模式下具有良好的响应性。

#### [修改] [game_page.dart](file:///d:/python%20programs/GaryTTL/Splendor/splendor_client/lib/ui/game/game_page.dart)
- 使用 `SystemChrome` 显式将屏幕方向锁定为横屏。
- 添加 `FocusScope` / `FocusNode` 以支持方向键（D-Pad）导航（为安卓电视/投影仪做准备）。

#### [修改] [splendor_card_widget.dart](file:///d:/python%20programs/GaryTTL/Splendor/splendor_client/lib/ui/game/widgets/splendor_card_widget.dart)
- 移除或根据平台条件化 `MouseRegion` 悬停效果。
- 添加 `GestureDetector.onLongPress` 以在触摸设备上触发卡牌放大预览。

## 验证计划

### 自动化测试
- 运行 `flutter build apk --debug` 验证编译是否成功。

### 手动验证
- 部署到安卓模拟器或真机。
- 测试触控交互：点击购买、长按放大。
- 测试安卓返回键行为。
- 在模拟器中使用方向键进行导航测试。
