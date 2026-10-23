# Reboot and physical remote verified

Rebooted once after the handover and reconnected via authenticated ADB. `sys.boot_completed=1`; the new launcher was already in focus, and Home key/resolver/foreground checks all confirmed it. Wallpaper and dock survived; real TV screenshot inspected. Active Wi-Fi survived.

Compared disabled packages before/after reboot: firmware re-enabled only `com.tcl.notereminder`. Do not repeatedly disable it; it stays hidden through the saved configuration/theme. The other ten session disables persisted, and the original three factory-disabled packages stayed disabled.

Owner confirmed physical Home, Input/Source, Settings, Netflix, YouTube and Prime Video buttons work and held Volume Up repeats. No accessibility helper is needed or enabled; current enabled-accessibility-services setting is null.

Streaming programme playback and any HDMI/tuner picture/sound confirmation remain pending. Owner requested the full app review list before choosing further disables and ordering; see `device/apps-for-review.md`. ADB closure is intentionally pending completion of those choices. Do not mark the overall task finished until debugging has been switched off/revoked, the TV rebooted, and the port checked closed.
