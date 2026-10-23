# Four-background gallery verified

The owner asked to remove Batman after the first gallery test. Its image was removed from the active theme and deleted through the launcher's ThemeProvider on the TV. Reading that exact provider URI now returns `FileNotFoundException` / `ENOENT`. The source image in Downloads, Git history and a private recovery copy remain intact. No app/package state was changed.

The active sequence is Doctor Doom → racing driver → Spider-Man → warrior → Doctor Doom. Both sideways images are upright, all four backgrounds fill 16:9 without stretching, and timed rotation is off. All five initial images were individually displayed and inspected from real-TV screenshots before Batman's removal.

The real remote test recorded three separate SCREEN_OFF/SCREEN_ON cycles. Starting from Doctor Doom, the final screenshot showed the third following image, Batman, as the five-image sequence predicted. The TV's boot count stayed the same during those standby cycles. After removal, the gallery restarted on Doctor Doom; returning from Settings preserved it. A full reboot increased the boot count and advanced exactly once to the racing picture. The custom launcher remained the actual focused Home, Wi-Fi/ADB returned, and all 24 disabled packages were unchanged. Display remained physical 1920×1080, density 320, with no overrides. D-pad top-bar edges and dock/grid row movement were checked again.

Screenshots below are from the real TV, resized for sharing; only the network-name pill was redacted. Full originals remain privately in `shots/`.

- [Before cold boot: Doctor Doom](../verification/03-gallery-before-boot.jpg)
- [After cold boot: racing driver](../verification/04-gallery-after-boot.jpg)
- [Warrior background](../verification/05-gallery-warrior.jpg)

Validation: 191 JVM tests passed; lint has zero errors and 74 existing warnings; release build succeeded. APK is 486,231 bytes, below the unchanged 491,520-byte limit. SHA-256: `f27b36f653af42086bfcec9eea58a0d3ae7abcf32c48ad993b20ecf9e8d0baf8`. Transfer MD5 matched and `pm install -r` succeeded. The five theme-focused Python modules passed all 36 tests; the three screenshot/switch checks passed after adding the real-TV evidence. The full inherited suite's unrelated documentation/missing-file failures recorded in checkpoint 15 remain unresolved; no claim is made that the full suite passes.

Undo only this customization with `TV_HOST=<tv-ip> ./restore-wallpaper-gallery.sh`. It restores the prior single Doctor Doom background while retaining app choices and custom Home. The original APK remains in the private pre-gallery backup if a binary rollback is needed. No new permissions, services, network access, dependencies, helpers or package-disable changes were introduced. Final debugging shutdown still requires the owner's remote steps.
