# Wi-Fi handover clearance

Verified the active Wi-Fi connection uses network ID 4, saved by `com.android.tv.settings` (uid 1000). Setupwraith owns only an older saved network. The owner explicitly authorised removal of that older saved connection on 23 October 2026. The active network is to be preserved.

When the launcher is installed and its actual foreground activity verified, the existing `FORCE_SETUPWRAITH=1` option may be used for this specific saved-network condition. No change to the upstream safety guard. Stock Home remains enabled until the launcher starts successfully.
