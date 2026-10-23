# TCL G07 clean home

Device-specific setup based on [cleanyourtv](https://github.com/Gathin23/cleanyourtv), with the original MIT license. Native Java launcher, AndroidX RecyclerView and DynamicAnimation; no internet permission, blur or video. Doctor Doom wallpaper supplied by the owner.

**Status:** baseline backed up and inspected; launcher installed with Doctor Doom theme and verified as actual Home; nine promotional/cleaner packages plus two competing Home packages disabled. Navigation, reboot and physical-remote checks in progress. See [checkpoints](checkpoints/).

## Local backup

Original private backup: `/Users/anshmaansingh/tv/cleanyourtv/backup/2026-10-23-original/`. Screenshots: the adjacent `shots/` folder. These hold device/network/account details and stay off GitHub. ADB keys also stay local.

## Theme

[device/doctor-doom/config.json](device/doctor-doom/config.json) sets four dock apps in left-to-right order using `dock_apps`; `columns` controls slots. Replace `device/doctor-doom/wallpaper.jpg` to change the background. After installation, push with `TV_HOST=<tv-ip> tools/theme.sh device/doctor-doom`. The TV IP may change after reconnecting Wi-Fi.

## Recovery and maintenance

Only reversible `pm disable-user --user 0` changes will be used. Use `TV_HOST=<tv-ip> ./restore-tv.sh` to re-enable the session packages and restore stock Home. `TV_HOST=<tv-ip> ./build-and-install-tv.sh` rebuilds from source, installs with stock Home preserved, and pushes the Doctor Doom theme. Create `tools/venv` with Python and install `tools/requirements.txt` first. The scripts use the locally downloaded SDK/JDK; override `ANDROID_HOME`, `JAVA_HOME` and `GRADLE_USER_HOME` on another computer. Re-enable a single app with `TV_HOST=<tv-ip> tools/venv/bin/python tools/tv.py 'pm enable --user 0 PACKAGE.NAME'`. No packages are uninstalled. Streaming, casting, voice assistant, firmware updates, input/remote services and Android core packages are preserved.

Private DNS was left unchanged. If AdGuard DNS is selected later, it does not block YouTube ads; undo with `settings put global private_dns_mode opportunistic` after reconnecting ADB.

At completion, switch USB and Network/ADB debugging off, revoke authorisations, reboot, and verify the ADB port refuses connections with `tools/adb-closed.py <tv-ip>`.
