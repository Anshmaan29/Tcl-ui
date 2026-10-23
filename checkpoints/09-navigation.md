# Real TV navigation checks

Controlled ADB key tests with screenshots inspected:

- Home resolves to and actually focuses the new launcher.
- Dock → one app row with Down, and Up returns to the same dock column.
- Up from the dock reaches the header. Repeated Left stays on Inputs; repeated Right stays on Settings.
- Inputs opens the compact glass dropdown with HDMI 1, HDMI 2, HDMI 3, AV and Live TV.
- Settings opens the real Android TV Settings activity.
- Static Doctor Doom wallpaper, network name, title/glow and scrolling grid render without display overrides.

Raw screenshots remain local because Home includes the private Wi-Fi name. Physical-remote buttons, reboot persistence and source programme playback are separate checks; injected keys are not proof of those. No accessibility helper enabled.
