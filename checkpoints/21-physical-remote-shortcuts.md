# Physical Netflix and YouTube buttons — 24 October 2026

The owner reported that the dedicated Netflix and YouTube buttons did not work, despite normal launcher navigation and playback working. Logs from the real remote identified Netflix as vendor keycode `4062` and YouTube as `4065`. Held Volume Up produced repeated `24` events in the baseline. No accessibility key helper was enabled before this repair.

Configured the existing `InputKeyService` with exactly those two app mappings. Confirmed it under the current user's Bound services, with no crashed service. The owner tested the real buttons and answered: “Both buttons work; volume repeats”. This G07 test did not reproduce the volume-repeat loss documented on some other TCL firmware. HomeKeyService stays off. The stock launcher remains disabled; no package states or app data changed for this repair.

The theme now records both mappings and `restore_key_services: true`. Granted the launcher's already-declared `WRITE_SECURE_SETTINGS` permission for the existing helper-recovery feature. `build-and-install-tv.sh` passes `INPUT_KEY_SERVICE=1 RESTORE_KEY_SERVICES=1` on future installs. No APK/source code, manifest permission declaration, dependency or safety guard was changed. AUTO_START is an unknown app-op on this firmware, so the attempted optional app-op grant made no change.

Undo just the helper with `disable-remote-shortcuts.sh`; it removes only InputKeyService and preserves other accessibility services. The stock-Home restore script also calls it. Shell syntax checks passed. The undo was not executed against the working final setup.

Playback remains a separate issue: the earlier YouTube failure was recovered by releasing FanCode's retained hardware decoder (checkpoint 19). A launcher cannot guarantee future third-party player/network/server behaviour. Do not claim a permanent decoder fix or daily reliability guarantee from the successful recovery alone. A further FanCode exit/resource check began, but ADB became unreachable before it could be completed. Final reboot persistence and debugging shutdown verification remain pending at this checkpoint.
