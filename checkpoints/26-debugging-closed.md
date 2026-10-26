# Debugging shutdown verified — 26 October 2026

After finishing customisation, the owner explicitly asked to switch debugging off and close the port, replacing the earlier instruction to leave it enabled.

Opened Developer options and captured the real TV screen with **Revoke USB debugging authorisations** highlighted. The owner then confirmed completing revocation, switching USB debugging off (and any separate Network/ADB switch), and restarting the TV through Settings, leaving it on.

Ran `tools/adb-closed.py <tv-ip>` afterwards. It returned exit 0 with the explicit result **“is closed: the TV refused the connection.”** This is a connection refusal, not a timeout or macOS “No route to host” result. Network ADB on port 5555 is closed at this check.

The last screenshots remain private in `shots/2026-10-26-debugging-shutdown.png` and `shots/2026-10-26-revoke-ready.png`. No ADB screenshot can be pulled after the connection has been closed. No further TV settings, app data, wallpaper configuration or remote mappings were changed during shutdown. The eight-image, ten-minute Home rotation and verified Settings/Netflix/YouTube remote mappings remain the delivered configuration.
