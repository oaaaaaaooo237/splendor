# Splendor Android Port (v1.0) 开发任务

- [x] **Phase 1: 环境配置与基础构建** <!-- id: 100 -->
    - [x] 验证 Flutter Android 构建环境 (`flutter doctor`) <!-- id: 101 -->
    - [x] 配置 `AndroidManifest.xml` (权限, Label, Icon) <!-- id: 102 -->
    - [x] 首次尝试构建 APK (`flutter build apk`) 并安装测试 <!-- id: 103 -->
    - [x] 创建 Agent Skill: `build_android` (自动化构建脚本) <!-- id: 104 -->

- [ ] **Phase 2: UI/UX 移动端适配** <!-- id: 200 -->
    - [ ] **屏幕适配** <!-- id: 201 -->
        - [ ] 强制锁定横屏 (Landscape) <!-- id: 202 -->
        - [ ] 检查并修复 UI 溢出 (Overflow) 问题 (小屏测试) <!-- id: 203 -->
        - [ ] 优化侧边栏布局 (在手机上可能过宽) <!-- id: 204 -->
    - [ ] **交互优化 (Touch Logic)** <!-- id: 205 -->
        - [ ] 移除所有 `MouseRegion` / 悬停逻辑 <!-- id: 206 -->
        - [ ] 实现长按 (Long Press) 查看卡牌/贵族详情 <!-- id: 207 -->
        - [ ] 增大按钮点击区域 (Hit Test area) <!-- id: 208 -->

- [ ] **Phase 3: 系统集成与生命周期** <!-- id: 300 -->
    - [ ] **物理按键** <!-- id: 301 -->
        - [ ] 拦截 Android 返回键 (Back Button) -> 弹出退出确认框 <!-- id: 302 -->
    - [ ] **生命周期** <!-- id: 303 -->
        - [ ] 监听 App 切后台 (Pause) -> 自动暂停游戏/音效 <!-- id: 304 -->
        - [ ] 监听 App 恢复 (Resume) -> 恢复状态 <!-- id: 305 -->

- [ ] **Phase 4: 功能完整性验证** <!-- id: 400 -->
    - [ ] 验证本地多点触控 (Multitouch) 稳定性 <!-- id: 401 -->
    - [ ] 验证 Android 音频播放 (Audioplayers 延迟测试) <!-- id: 402 -->
    - [ ] 验证 SQLite 数据库在 Android 上的读写 <!-- id: 403 -->
    - [ ] 验证局域网联机功能 (WiFi) <!-- id: 404 -->

- [ ] **Phase 5: 发布准备** <!-- id: 500 -->
    - [ ] 版本号迭代 (v1.0.0) <!-- id: 501 -->
    - [ ] 签名配置 (Signing Config) <!-- id: 502 -->
    - [ ] 最终 Release APK 构建与归档 <!-- id: 503 -->
