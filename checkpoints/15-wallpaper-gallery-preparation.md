# Wallpaper gallery preparation

The owner requested four additional supplied images and a changed background each time the TV is switched on. The image service rejected orientation processing; the owner then explicitly approved local image tools. Two sideways images were rotated counterclockwise and all four fitted proportionally to 16:9. Doctor Doom is retained as the fifth image and unchanged single-image fallback.

The previous theme is saved in `device/before-wallpaper-gallery/`. The previous APK is retained privately under `backup/2026-10-23-before-wallpaper-gallery/`. `restore-wallpaper-gallery.sh` restores the old theme without changing apps or Home.

An off-by-default `wallpaper_change_on_wake` switch was added because the upstream feature only supported timed rotation. It records screen-off and boot count, advances once when Home is visible after wake, and retains the background on ordinary app returns. No service, permission, network feature or dependency was added. With the switch off there is no power receiver. Build, lint and all 191 JVM tests pass. APK size: 486,231 bytes, below the unchanged 491,520-byte limit.

The full inherited Python suite also ran: 666 tests, 42 failing assertions, 12 errors, 8 skipped. Most failures concern inherited upstream README tables and files absent from this device-specific fork; the new switch's required screenshot is pending real-TV verification and will be added next. No safety checks were relaxed.

New APK installation succeeded after checksum-verified transfer. During the switch-off baseline standby test the TCL disconnected ADB; the owner woke it with the real remote. Gallery activation and real-TV wake verification follow in the next checkpoint.
