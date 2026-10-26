# TCL G07 clean home

Device-specific setup based on [cleanyourtv](https://github.com/Gathin23/cleanyourtv), with the original MIT license. Native Java launcher, AndroidX RecyclerView and DynamicAnimation; no internet permission, blur or video. Eight wallpaper images supplied by the owner.

**Status:** Eight-background launcher installed and verified as Home through reboot. Standby wakes and cold boots advance the wallpaper; app returns keep it. The earlier red Batman image was removed at the owner’s request; a newly supplied Batman/fire image is now included. The 13 selected apps are in the owner’s exact order. The latest audit finds 21 disabled packages; three formerly disabled optional apps are now absent. TCL firmware re-enabled its reminder app, which stays hidden. Navigation and real remote buttons were verified; YouTube playback recovered, while FanCode retains a reproducible decoder issue. The five-logo first page, separate apps page and two-minute idle gallery were installed and checked on the real TV; see [the design checkpoint](checkpoints/20-logo-pages-and-idle-gallery.md). The [regression QA record](checkpoints/23-regression-qa.md) distinguishes app launch from playback and records sign-in/service limitations. Debugging remains enabled at the owner’s explicit request; no port-closure claim is made. HDMI/Live TV programme playback was not tested because no source was connected. See [checkpoints](checkpoints/).

## Local backup

Original private backup: `/Users/anshmaansingh/tv/cleanyourtv/backup/2026-10-23-original/`. Later private backups and final state: this checkout’s `backup/` folder. Screenshots: this checkout’s `shots/` folder (early screenshots also remain beside the original backup). These hold device/network/account details and stay off GitHub. ADB keys also stay local.

## Theme

[device/doctor-doom/config.json](device/doctor-doom/config.json) stores the full priority order in `dock_apps`; `columns: 5` places the first five in the dock. Press Down from the logos to open the remaining favourites on a separate apps page, in the same priority order. Apps newly installed later follow the saved favourites. Changing this list also invalidates an older on-TV manual order without deleting it. After installation, push with `TV_HOST=<tv-ip> tools/theme.sh device/doctor-doom`. The TV IP may change after reconnecting Wi-Fi.

The [wallpaper gallery](device/doctor-doom/ASSETS.md) contains Doctor Doom, the racing driver, Spider-Man, the warrior, Batman/fire, the soldier, Loki and Moon Knight. `wallpaper_change_on_wake: true` advances once after standby wake or a cold boot; `wallpaper_order: "sequential"` cycles in filename order without an immediate repeat. `wallpaper_rotation_minutes: 10` also advances the picture every 10 minutes while Home is visible. Other apps are unaffected; returning Home may advance an overdue picture. This small source feature is off by default for other themes. It uses the boot count and screen broadcasts, with no additional permission, service, network access or polling.

Add or replace images in `device/doctor-doom/wallpapers/`, using 16:9 landscape JPEGs and stable filenames, then push the theme. Keep each file comfortably below 300 KB. A single image selected in Launcher settings overrides the gallery; select **Theme default** to resume it. `TV_HOST=<tv-ip> ./restore-wallpaper-gallery.sh` restores the previous single Doctor Doom background and preserves the chosen apps and Home. The prior APK also remains in the private pre-gallery backup.

## Logo design and idle gallery

The favourites row uses Netflix, Prime Video, YouTube, JioHotstar and the supplied pearlescent Apple TV mark. There is no PlayStation tile. Inputs, Wi-Fi and Settings are icon-only buttons. `logo_dock: true` loads transparent `logos/PACKAGE.png` artwork; `quiet_grid: true` makes lower cards smaller inside the same five navigation columns. All 13 chosen apps keep their priority order. With `paged_home: true`, page one contains only the five logos; Down opens the other apps. Up from their first row returns to the corresponding logo. Back and Home also return to page one.

`gallery_idle_seconds: 120` fades the controls away after two minutes on Home, showing the current wallpaper and a small clock. The first D-pad, OK or Back press restores your previous selection without launching anything. Home also exits the gallery; volume keys keep working normally. Gallery mode is confined to Home, and background rotation still happens on wake/boot. Set the value to 0 to disable idle gallery.

`TV_HOST=<tv-ip> ./restore-logo-dock.sh` restores the preceding four-column banner design and keeps the four-background rotation and app choices. No rebuild is needed to change the timeout, columns or logo files after this source build is installed. The previous APK and full pre-update backup remain local.

## Remote app buttons

The physical Netflix and YouTube buttons map to `4062` and `4065` in `app_keys`. The physical Settings button maps by Linux scancode `233` to the normal TCL Settings entry (`scan:233:com.tcl.settings`), using the same helper. Only `InputKeyService` is enabled; `HomeKeyService` stays off. The owner tested both app buttons and confirmed that held volume still repeats on this G07 firmware. `restore_key_services: true` and the existing secure-settings permission let Home restore this helper after a force stop. The build-and-install script passes `INPUT_KEY_SERVICE=1 RESTORE_KEY_SERVICES=1` so a reinstall also keeps the shortcuts.

To undo just this helper, run `TV_HOST=<tv-ip> ./disable-remote-shortcuts.sh`, or switch off Home under TV Settings → Accessibility. The script preserves other accessibility services. `restore-tv.sh` also switches the helper off when returning to stock Home.

## Recovery and maintenance

All app removals used reversible `pm disable-user --user 0` changes. Use `TV_HOST=<tv-ip> ./restore-tv.sh` to re-enable the session packages and restore stock Home. `TV_HOST=<tv-ip> ./build-and-install-tv.sh` rebuilds from source, installs with stock Home preserved, and pushes the Doctor Doom theme. Create `tools/venv` with Python and install `tools/requirements.txt` first. The scripts use the locally downloaded SDK/JDK; override `ANDROID_HOME`, `JAVA_HOME` and `GRADLE_USER_HOME` on another computer. Re-enable a single app with `TV_HOST=<tv-ip> tools/venv/bin/python tools/tv.py 'pm enable --user 0 PACKAGE.NAME'`. No packages are uninstalled. The 13 selected media apps, Chromecast, Miracast, voice assistant, firmware updates, input/remote services and Android core packages are preserved. MagiConnect and the other unselected optional apps are disabled at the owner’s request.

If YouTube stays black while its menus load, a background streaming app may still hold a hardware decoder. On this TCL, Android logs identified FanCode retaining a decoder; force-stopping only FanCode released it and the owner confirmed YouTube playback. FanCode remains installed. A later controlled test showed that Back and even FanCode’s **Exit App** can leave one decoder allocated on FanCode 3.1.1. If playback turns black after FanCode, use TV Settings → Apps → FanCode → **Force stop**, then retry. This preserves app data; do not clear data or uninstall. The TV’s Play Store currently offers no update for this app. No automatic app killer is enabled, and a permanent vendor-player fix is not claimed. See [the controlled exit test](checkpoints/22-fancode-decoder-exit-test.md).

Private DNS was left unchanged. If AdGuard DNS is selected later, it does not block YouTube ads; undo with `settings put global private_dns_mode opportunistic` after reconnecting ADB.

At completion, switch USB and Network/ADB debugging off, revoke authorisations, reboot, and verify the ADB port refuses connections with `tools/adb-closed.py <tv-ip>`.

## App choices

See the numbered [app review list](device/apps-for-review.md). The owner’s chosen order is saved in [priority-order.json](device/priority-order.json). Keep: Netflix, Prime Video, YouTube, JioHotstar, Apple TV, FanCode, ZEE5, SonyLIV, F1 TV, Spotify, Airtel Xstream, YouTube Music, discovery+. Other optional apps from the review list are disabled; Google Play Store/Services and essential TV services are preserved. `restore-app-selection.sh` restores just this selection and prior theme while retaining the custom Home; `restore-tv.sh` restores the original stock Home and all session-disabled apps.

## Customize later

On the TV, enable USB debugging (and Network/ADB debugging if present), accept the computer authorisation prompt, and check the current IP under Network. From this checkout, use `TV_HOST=<tv-ip> tools/venv/bin/python tools/tv.py --probe`. The Python client handles this Mac’s ADB connection. Edit the theme JSON and push it with `tools/theme.sh`; no rebuild is needed for app priority, columns, colours or wallpaper images once the current source build is installed. Keep the saved `device/before-app-selection/` and `device/before-wallpaper-gallery/` themes for their respective rollbacks. Close/revoke debugging again after the next session.
