# Exact priority layout verified on TV

Applied the theme with the complete 13-app favourite order and four columns. Inspected Home and all three grid-row screenshots from the real TV:

- Dock: Netflix, Prime Video, YouTube, JioHotstar.
- First grid row: Apple TV, FanCode, ZEE5, SonyLIV.
- Second grid row: F1 TV, Spotify, Airtel Xstream Play, YouTube Music.
- Last grid row: discovery+, then Google Play Store (preserved for app updates).

Validated actual package states: 13 selected apps enabled, all 11 removal targets disabled, 15 protected/functionality packages enabled. Total disabled packages before final reboot: 24 (21 session disables plus three originally disabled). Nothing uninstalled. Static wallpaper unchanged and transfer checksum matched.

No source code or APK rebuild needed: the existing favourite sorter supports the full priority list while columns limits the dock to four. The final reboot/persistence and ADB closure checks follow.
