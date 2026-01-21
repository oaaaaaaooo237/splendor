# Splendor v3.8.2 Stable Release Notes

> **发布日期**: 2026-01-21
> **类型**: Bug修复与视觉优化 (Hotfix & Enhancement)

## 核心变动 (Key Changes)

### 1. 视觉修复：卡牌悬浮机制重构 (Card Hover Overhaul)
针对高分辨率及最大化窗口下的体验进行了底层重写，彻底解决了“放大反而变小”和“布局挤压”的问题。

*   **Overlay 悬浮层**: 鼠标悬停时的放大卡牌现在渲染在一个独立的 **Overlay Layer** 上，完全脱离棋盘布局 (`FittedBox`) 的约束。
*   **智能视觉缩放 (Visual Scale Calculation)**:
    *   系统现在会自动计算卡牌在屏幕上的 **实际物理像素大小** (Visual Size)，而不仅仅是逻辑大小。
    *   **2x 放大**: 悬浮卡牌的大小被严格锁定为 **可视大小的 2 倍** (面积 4 倍)，确保在任何分辨率和窗口缩放比例下都能提供震撼的放大效果。
*   **屏幕边界保护 (Screen Clamping)**:
    *   自动检测屏幕边缘，防止放大的卡牌超出窗口顶部或左右边界。
*   **冲突解决**: 移除了 `GamePage` 中会导致“双重悬浮”或“两层阴影”的旧代码逻辑。

## 已知问题 (Known Issues)
*   **Android Porting**: Android 移植工作正在规划中 (v1.0)，目前版本仅针对 Windows 桌面端优化。

## 升级指南 (Upgrade Guide)
*   直接解压替换旧版本即可，无需迁移数据 (本地数据库兼容)。
