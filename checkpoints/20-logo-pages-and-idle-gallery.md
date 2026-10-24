# Logo pages and idle gallery — 24 October 2026

Installed a source-built launcher update on the TCL G07 Android 11 TV. Netflix, Prime Video, YouTube, JioHotstar and the supplied pearlescent Apple TV artwork form the five-logo first page. There is no PlayStation tile. Inputs, Wi-Fi and Settings use icons. No lower app tiles appear on the first page.

Down from a logo opens a separate apps page in the preserved priority order. Up from its first row returns to the corresponding logo. Back and Home return to page one. The last short row clamps Down to its final tile and stops at horizontal edges. The two pages share the existing RecyclerView and app collection; no second activity or second app inventory is created. Reorder temporarily shows the complete grid and then restores paging.

After 120 idle seconds on Home, all controls disappear and the existing wallpaper remains with a small clock. A real two-minute test showed that the first Right key restored Prime Video, still selected, without moving to YouTube or launching an app. The earlier header-stays-visible issue was corrected before this handover. Gallery mode stops when Home leaves the foreground.

## Evidence and validation

- [First page](../verification/06-logo-dock.jpg), [apps page](../verification/07-quieter-grid.jpg), [idle gallery](../verification/08-idle-gallery.jpg) and [Home after reboot](../verification/09-logo-home-after-reboot.jpg) are pulled from the real TV. Private full-resolution originals and edge/navigation screenshots remain in `shots/`.
- Verified page transitions, corresponding-column focus, horizontal boundaries, the short final row, Back, Home, and the icon controls. The page-return focus race found on the TV was fixed and retested.
- Reboot returned to the custom Home with validated Wi-Fi internet. Wallpaper advanced from Doctor Doom to the racing image. All 24 disabled packages exactly match the previous final snapshot, before and after reboot.
- 194 JVM tests passed; release lint has zero errors. The 33 focused Python theme/path/ownership checks and 3 switch-screenshot checks passed. The inherited full Python suite has unrelated missing upstream docs/table failures, as recorded previously; it is not claimed green.
- Release APK: 489,123 bytes, below the unchanged 491,520-byte gate. SHA-256: `e8a1fb659c8de2674d8e0f09f38a0947d63afefb3d82808f39d6aa2774aacb83`. The built APK stays in the private final backup, not Git.
- The new logo design benchmark before paging sampled launcher PSS at 94 MB versus 93 MB baseline, and idle launcher CPU at 0.1% versus 0%. Firmware exposes no usable frame timestamps, so latency/FPS/jank are unavailable. A later final-build memory snapshot was 70,289 KB PSS; that is a different runtime state and is not evidence of a measured improvement.

No new launcher permission, dependency, service, network polling, blur or video was added. Logo images are bounded before decoding. Gallery reuses one current wallpaper and one delayed callback. Background rotation, the 13 chosen media apps, Play/core services, voice, casting, firmware updates and remote/input services remain preserved. The YouTube incident and confirmed recovery are documented separately in [checkpoint 19](19-youtube-decoder-recovery.md).

`restore-logo-dock.sh` restores the preceding four-column banner theme while retaining the four-image gallery and app choices. `build-and-install-tv.sh` rebuilds and installs this source. Editing `device/doctor-doom/config.json` controls `paged_home`, `logo_dock`, `quiet_grid` and `gallery_idle_seconds`; all four default off for other themes. The prior APK/theme and full backup remain private under `backup/2026-10-24-before-logo-dock/`.

Physical-remote acceptance and the final debugging revocation/port-refusal check follow. Do not interpret this checkpoint as proof that network ADB is closed.
