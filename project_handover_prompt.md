# Splendor Private Cloud - Project Context & Android Porting Prompt

**Version**: v3.7 Stable
**Date**: 2026-01-10

## 1. Project Overview
"Splendor Private Cloud" is a digital implementation of the board game Splendor. It features a Flutter-based client (Windows/Android target) and a Dart-based WebSocket server. The project emphasizes visual quality, smooth animations, and strict adherence to official game rules.

## 2. Technical Architecture
- **Repo Structure**: Monorepo
    - `splendor_client/`: Flutter App (UI, Audio, Local Game Logic Adaptation).
    - `splendor_server/`: Dart Server (WebSocket, Room Management).
    - `splendor_shared/`: Core Game Logic (Engine, Models, Validators), shared by both.
- **State Management**: `flutter_riverpod` (v2.x).
- **Networking**: `web_socket_channel` (Client), `shelf_web_socket` (Server).
- **Core Logic**:
    - Pure Dart, dependency-free in `splendor_shared`.
    - Event-sourced architecture (`applyAction` -> `GameState` update).
    - Validation handled by `ActionValidator`.

## 3. Current Status (v3.7)
- **Gameplay**: Complete. Supports Buying, Reserving, Nobles, Gold retrieval.
- **Rules**: Official Standard Deck (Static), Official Nobles (Static). Validated against edge cases (e.g., 0-gem selection blocked).
- **Modes**:
    - **Single Player**: vs AI Bots (Easy/Standard/Hard - Simple Heuristics).
    - **Local Multiplayer**: Hotseat (via `LocalGameRepository`).
    - **Online**: Lobby System, Real-time moves (via `RemoteGameRepository`).
- **UI**: High-fidelity Assets, Hover effects (Mouse), Animations (Flutter Animate).

## 4. Prompt for Android Development Agent
*Copy and paste the following prompt to start the next session context:*

---
### **Role**:
You are an expert Flutter Developer specializing in Cross-Platform adaptations (Desktop to Mobile).

### **Context**:
I have a stable Splendor game project (v3.7) currently optimized for Windows Desktop.
The project uses a monorepo structure with `splendor_client`, `splendor_server`, and `splendor_shared`.
The Desktop version features mouse-hover effects, large landscape layouts, and keyboard/mouse interactions.

### **Objective**:
Port the `splendor_client` to Android, ensuring a native-quality touch experience while maintaining the premium visual style.

### **Key Requirements (Phase 5)**:
1.  **Environment Configuration**:
    - Configure `android/build.gradle` and `local.properties` for correct compilation.
    - targetSdkVersion: 34.
    - Ensure `INTERNET` permissions are enabled.

2.  **Touch Interaction Adaptation**:
    - **Problem**: The game relies heavily on `MouseRegion` for "Hover to Zoom" (Code: `GamePage.dart` -> `_buildHoverableCard`).
    - **Requirement**: Replace/Augment Hover logic with Touch logic.
        - **Tap**: Select/Action (Keep existing).
        - **Long Press**: Inspect Card (Zoom overlay).
        - **Touch Release**: Clear inspection overlay.
    - **Safety**: Ensure no sticky states (e.g., overlay getting stuck after finger lift).

3.  **Responsive Layout**:
    - **Problem**: Desktop has a fixed large aspect ratio. Mobile screens are narrower (19.5:9) and smaller.
    - **Requirement**:
        - Use `FittedBox` or `LayoutBuilder` to scale the entire Game Board to fit the screen width/height.
        - Verify sidebar (Player Info, History) accessibility. It might need to be a drawer or a toggleable overlay on mobile.

4.  **Asset & Icon**:
    - Generate and configure adaptive icons for Android (`mipmap` resources).

5.  **Build**:
    - Generate a signed Release APK for testing.

---
