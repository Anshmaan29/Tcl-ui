# Final app-selection verification

Rebooted after applying the selected apps/theme. `sys.boot_completed=1`, actual Home focus is `com.gathin.tvhome/.MainActivity`, and all 24 disabled states exactly match the pre-reboot list. All 13 chosen apps remain enabled. Final Home screenshot pulled and inspected; exact grid order was inspected before reboot. TCL’s passthrough and digital-tuner input services remain present; the ZEE5 virtual input also remains.

Owner confirmed streaming picture/sound works after the final selection. No HDMI or Live TV source was connected for programme playback, so that remains untested. Earlier owner physical-remote checks passed and no helper was enabled.

Saved final private package/settings/network/input backup locally. Final ADB shutdown is the remaining step: revoke authorisations, debugging off, restart, then verify port 5555 refuses connections.
