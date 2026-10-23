# Home handover verified

After verifying the installed launcher and theme, applied the two-entry handover list with the existing `FORCE_SETUPWRAITH=1` option, as explicitly authorised for the older saved Wi-Fi connection. Setupwraith was disabled first, then the stock launcher, one shell call each. Recovery state saved before both. No safety code changed.

Set `com.gathin.tvhome/.MainActivity` as Home and injected the Home key. Both resolver output and actual `mFocusedApp` confirm the new launcher. Captured and inspected the real TV screenshot. Wi-Fi/ADB remained connected.

Total newly disabled so far: 11 (nine debloat, two Home handover), plus the same three factory-disabled packages. Reboot persistence and real remote button checks remain pending. No accessibility helper enabled yet.
