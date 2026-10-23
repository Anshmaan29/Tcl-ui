# Package review and recovery preparation

- Categorized every installed package in [package-inventory.csv](../device/package-inventory.csv).
- Prepared three conservative batches of three packages each; inspected their activities/services with `dumpsys package`. No system core/input/remote/keyboard packages selected.
- TCL BI analytics shares its package with the firmware updater; preserve it. Agreement/update proxy and partnercustomizer's TKey remote function also preserved.
- All installed streaming apps, voice assistant, Chromecast, Miracast, Media Center, Gallery and firmware updates preserved.
- Wrote `restore-tv.sh` and `build-and-install-tv.sh`; shell syntax checks passed. Restore preserves the three packages already disabled before the session.
- No package has yet been disabled. Wi-Fi owner handover is waiting for a Settings reconnect.
