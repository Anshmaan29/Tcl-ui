# Baseline — 23 October 2026

- Upstream: https://github.com/Gathin23/cleanyourtv at `c5d75e8e8071d6545e78ccbb6b4a303774f2e048`. MIT license retained.
- Device verified through authenticated Python ADB: TCL G07 / G07_4K_GB_NF, Android 11 (SDK 30), AR07, V8-R51AT01-LF1V126.
- Display: physical 1920 × 1080, density 320; no overrides.
- Full package list, originally disabled list, getprop, all three settings namespaces, USB/network/input details and package manifests saved locally before modifications. Raw dumps and ADB credentials excluded from this public repository.
- Original Home: `com.google.android.apps.tv.launcherx/.home.HomeActivity`; setupwraith also claims Home.
- Three packages already disabled: Stan, Rakuten TV, TCL SmartAlexa. Preserve that state on restore.
- Screenshots pulled from the real TV and inspected.
- Setup wizard owns saved Wi-Fi networks. Launcher handover waits for owner to forget/rejoin through Settings and for verification.
- Nothing disabled or installed at this checkpoint.
- Planned dock: Netflix, Prime Video, YouTube, JioHotstar. User delegated layout choice. User supplied Doctor Doom wallpaper.
- Streaming apps, voice, casting, firmware updates and DNS preserved.
