# Launcher installed and theme inspected

APK transferred with upstream base64 chunk uploader; matching local/remote MD5 `08c9c72373ed4016dddc9d0593c2d432`. `pm install -r` returned Success. Explicit activity launch returned Status: ok, and `mFocusedApp` showed `com.gathin.tvhome/.MainActivity`.

Pushed the owner-supplied Doctor Doom wallpaper with matching MD5 `df4ace8917ed89ff543b80ee5bace4b4`; applied theme using the upstream ThemeProvider path. Inspected a real TV screenshot after the launch transition completed: wallpaper, clock/date/greeting, Inputs/network/Settings pills, large focused-app title and four-app glass dock render correctly. Network name visible locally; raw screenshot kept off this public repository.

The TV accepts the HOME-declaring launcher. `set-home-activity` reported Success while stock Home still actually took focus; this was verified, not assumed. Stock launcher remained enabled through the complete install/theme inspection. Handover follows as a separate recorded, reversible step.
