# Owner app selection

Owner specified this priority order and requested other optional apps disabled: Netflix, Prime Video, YouTube, JioHotstar, Apple TV, FanCode, ZEE5, SonyLIV, F1 TV, Spotify, Airtel Xstream, YouTube Music, discovery+. Explicit removal names also included MagiConnect, Play Movies, MX Player, Rakuten Viki and hoichoi.

Prepared four small disable lists (11 optional packages), inspected each package's activities/services and requested permissions, and saved current package states and theme locally. All 11 targets are outside the 13 keep packages and request no TV_INPUT_HARDWARE permission. TCL Channel provides optional FAST channels, separate from TCL HDMI/tuner services. Preserve TV/input/remote/keyboard/Play/core services, voice, Chromecast, Miracast and OTA.

Use `columns: 4` with the complete priority list in `dock_apps`: the existing adapter sorts all favourites in list order, while only the first four occupy the dock. No code change or rebuild required. Saved private on-TV ordering is left untouched; changing the configured dock key makes it inactive, and restoring the old theme reactivates it. The prior theme is saved in `device/before-app-selection/`.

`restore-app-selection.sh` restores these optional packages and the prior theme while keeping the custom launcher as Home. `restore-tv.sh` also includes the new lists for a complete rollback.
