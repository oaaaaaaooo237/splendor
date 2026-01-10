# Splendor Private Cloud (v3.7 Stable)

## Release Notes (v3.7.0)
**Release Date**: 2026-01-10
**Status**: Stable

### Test Status
- **Single Player Mode**: Tested & Verified (Basic gameplay, bots, turn logic).
- **Network Server**:
  - WebSocket (WS): Tested & Verified.
  - Secure WebSocket (WSS): Tested & Verified.
- **Multiplayer Features**: Other online interaction features have *not* been fully regression tested in this release.

### Changelog
- **Standard Deck**: Implemented official Splendor card and noble distribution.
- **Bug Fixes**:
  - Fixed "Stuck Hover" effect on cards.
  - Fixed logic allowing selection of 0-count gems.
  - Corrected missing Noble assets (4 Black / 4 Green).
  - Fixed local game timer duration settings.

## Getting Started

### Client
Run `Splendor.exe` inside the `Client` folder.

### Server
- **Windows**: Run `server.exe`.
- **Docker**: Load image `docker load -i splendor_server_v3.7.tar`.
