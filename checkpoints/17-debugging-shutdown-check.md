# Debugging shutdown check: pending

The owner reported completing authorisation revocation, disabling debugging and restarting. The subsequent `tools/adb-closed.py <tv-ip>` check still accepted a TCP connection on port 5555. This is not a successful closure check. No ADB authentication or shell reconnection was attempted after revocation.

The owner was asked to confirm USB debugging is off, disable any separate Network/ADB debugging switch, and use the TV Settings restart action rather than a normal remote standby cycle. Final explicit connection refusal remains pending. The launcher/gallery work is verified in checkpoint 16; no further TV changes were made during this check.
