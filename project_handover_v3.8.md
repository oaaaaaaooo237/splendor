# Splendor Private Cloud - Handover Document (v3.8 - Version 3)

**Version**: v3.8.0 (Ready for Dev)
**Date**: 2026-01-16
**Status**: **v3.7 Released** / **v3.8 Dev Environment Ready**

## 1. Project Overview
"Splendor Private Cloud" is a digital implementation of the board game Splendor.
The v3.7 stable version has been released to `dist/`.
We are now ready to begin full development of **v3.8 "Local Game"** features.

## 2. Key Accomplishments
### A. v3.7 Stable Release (Completed)
*   **Status**: Released.
*   **Location**: `splendor_client/dist/v3.7-stable/` (User confirmed).

### B. Infrastructure: Agent Skills (New)
To streamline v3.8 development, we have deployed the following Agent Skills in `.agent/skills/`:
1.  **`build_release`**: Automated build script for future versions.
2.  **`verify_project`**: One-click project health check (Analysis + Tests).
3.  **`start_feature_branch`**: Standardized workflow to start new features.

### C. v3.8 Feature Set (Planned)
*   **Menu**: Rename "Single Player" -> "Local Game".
*   **Setup**: New `LocalGameSetupPage` for 2-4 players (Human/Bot mix).
*   **Gameplay**: Full "Hotseat" support with "Transparency" (Open Hands).

## 3. Technical Changes (Session Summary)
| Component | Status | Details |
| :--- | :--- | :--- |
| **Agent Skills** | **Implemented** | Added `build_release`, `verify_project`, `start_feature_branch`. |
| `pubspec.yaml` | Updated | Version bumped to `3.8.0+1`. |
| `welcome_page.dart` | Pending | Code for v3.8 Menu changes is present but unverified. |

## 4. Current State & Verification
*   **Code Integrity**: `verify_project` skill is available ensuring code quality.
*   **Git Status**: The working directory may contain uncommitted changes from the previous "v3.8 test" attempts.
*   **Action Required**:
    1.  Use `start_feature_branch` to properly organize the v3.8 work next time.

## 5. Next Steps (For Next Session)
1.  **Start Clean**: Run the `start_feature_branch` skill to create `feature/v3.8-local-game`.
    *   *Prompt*: "Start v3.8 Local Game feature."
2.  **Verify Setup**: Run `verify_project` to ensure a clean slate.
3.  **Execute Implementation Plan**: Follow `v3.8_requirements_and_plan.md` Phase 1 (Menu) & Phase 2 (Setup Page).

---
**Note for User**: Have a safe trip home! When you return, just tell the Agent to "Start v3.8 development" and it will use the skills to set everything up.
