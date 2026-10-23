# Conservative debloat applied

Applied three batches of three packages with upstream `tools/disable.sh`, one `pm disable-user --user 0` command per shell call. Before each batch the tool saved original state for recovery. Confirmed actual disabled-package list after every batch, pulled a real TV screenshot and inspected it before the next batch. Network/Settings remained usable.

1. TGuard, Google Feedback, retail sticker.
2. TCL waterfall recommendations, promotional message box, reminders.
3. TCL Home dashboard, passive Home content, partner auto-installs.

Nine newly disabled, plus the same three packages that were already disabled at the start. No packages uninstalled. Stock Home and setupwraith still enabled pending safe handover. Streaming, voice, casting, firmware updates, input services, keyboard, Play Store/Services and Android core preserved.

Screenshots and recovery records kept locally because the active Settings page contains network identifiers. Reboot persistence check still pending; AR07 is known to re-enable reminders, which the theme also hides.

Post-batch checks: stock Home renders and responds to D-pad; the Input key opens TCL’s source panel. All 15 explicitly checked TV/input/remote/keyboard/Play/voice/cast/update packages remain enabled. `TvInputService` still lists TCL passthrough and digital tuner services. Actual HDMI/tuner programme playback remains unverified until tested on a connected source.
