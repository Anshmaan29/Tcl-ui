# TCL G07 clean home

Device-specific setup based on [cleanyourtv](https://github.com/Gathin23/cleanyourtv), with the original MIT license. Native Java launcher, AndroidX RecyclerView and DynamicAnimation; no internet permission, blur or video. Doctor Doom wallpaper supplied by the owner.

**Status:** Doctor Doom launcher installed and verified as Home through reboot. The 13 selected apps are in the owner’s exact order; 21 session packages are disabled, plus three that were already disabled. TCL firmware re-enabled its reminder app, which stays hidden. Navigation, real remote buttons and streaming playback verified. Final authorisation revocation/debugging shutdown is awaiting the owner’s remote steps. HDMI/Live TV programme playback was not tested because no source was connected. See [checkpoints](checkpoints/).

## Local backup

Original private backup: `/Users/anshmaansingh/tv/cleanyourtv/backup/2026-10-23-original/`. Later private backups and final state: this checkout’s `backup/` folder. Screenshots: this checkout’s `shots/` folder (early screenshots also remain beside the original backup). These hold device/network/account details and stay off GitHub. ADB keys also stay local.

## Theme

[device/doctor-doom/config.json](device/doctor-doom/config.json) stores the full priority order in `dock_apps`; `columns: 4` places only the first four in the dock. Remaining favourites appear in that same order below it. Apps newly installed later follow the saved favourites. Changing this list also invalidates an older on-TV manual order without deleting it. Replace `device/doctor-doom/wallpaper.jpg` to change the background. After installation, push with `TV_HOST=<tv-ip> tools/theme.sh device/doctor-doom`. The TV IP may change after reconnecting Wi-Fi.

## Recovery and maintenance

All app removals used reversible `pm disable-user --user 0` changes. Use `TV_HOST=<tv-ip> ./restore-tv.sh` to re-enable the session packages and restore stock Home. `TV_HOST=<tv-ip> ./build-and-install-tv.sh` rebuilds from source, installs with stock Home preserved, and pushes the Doctor Doom theme. Create `tools/venv` with Python and install `tools/requirements.txt` first. The scripts use the locally downloaded SDK/JDK; override `ANDROID_HOME`, `JAVA_HOME` and `GRADLE_USER_HOME` on another computer. Re-enable a single app with `TV_HOST=<tv-ip> tools/venv/bin/python tools/tv.py 'pm enable --user 0 PACKAGE.NAME'`. No packages are uninstalled. The 13 selected media apps, Chromecast, Miracast, voice assistant, firmware updates, input/remote services and Android core packages are preserved. MagiConnect and the other unselected optional apps are disabled at the owner’s request.

Private DNS was left unchanged. If AdGuard DNS is selected later, it does not block YouTube ads; undo with `settings put global private_dns_mode opportunistic` after reconnecting ADB.

At completion, switch USB and Network/ADB debugging off, revoke authorisations, reboot, and verify the ADB port refuses connections with `tools/adb-closed.py <tv-ip>`.

## App choices

See the numbered [app review list](device/apps-for-review.md). The owner’s chosen order is saved in [priority-order.json](device/priority-order.json). Keep: Netflix, Prime Video, YouTube, JioHotstar, Apple TV, FanCode, ZEE5, SonyLIV, F1 TV, Spotify, Airtel Xstream, YouTube Music, discovery+. Other optional apps from the review list are disabled; Google Play Store/Services and essential TV services are preserved. `restore-app-selection.sh` restores just this selection and prior theme while retaining the custom Home; `restore-tv.sh` restores the original stock Home and all session-disabled apps.

## Customize later

On the TV, enable USB debugging (and Network/ADB debugging if present), accept the computer authorisation prompt, and check the current IP under Network. From this checkout, use `TV_HOST=<tv-ip> tools/venv/bin/python tools/tv.py --probe`. The Python client handles this Mac’s ADB connection. Edit the theme JSON and push it with `tools/theme.sh`; no rebuild is needed for app priority, columns, colours or wallpaper. Keep the saved `device/before-app-selection/` theme if rolling back this round. Close/revoke debugging again after the next session.
