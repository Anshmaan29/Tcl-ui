# Physical Settings button mapping — 26 October 2026

The owner reported that the remote's Settings/gear button did nothing. A physical key recording showed three distinct `KEY_FORWARDMAIL` press/release pairs. The TV's input-device dump identifies the remote's active layout as `/system/usr/keylayout/Generic.kl`; that file maps Linux key/scancode 233 to the vendor name `TCL_SET`. The HID usage `000c0055` is not the scancode passed to the Android helper.

The normal launcher entry `com.tcl.settings/.MainActivity` was resolved and opened to verify that it reaches the ordinary TV Settings screen. Added `scan:233:com.tcl.settings` to the theme's existing `app_keys`, retaining the Netflix/YouTube mappings. InputKeyService already supports scancode mappings, so no source change, new helper, permission, dependency or APK was required. HomeKeyService remains off.

The theme was applied with the eight wallpapers and selected 10-minute rotation intact. InputKeyService is bound and the crashed-service list is empty. Raw input/layout/package logs and screenshots remain private in `work/2026-10-26-settings-key/` and `shots/` because the Settings screen includes network information.

The owner tested the real remote after the mapping was applied and confirmed: Settings opens, Netflix and YouTube shortcuts work, and held volume repeats. This is physical acceptance, in addition to the bound-service check; an injected key alone was not used as proof.

To undo only this mapping, remove `scan:233:com.tcl.settings` from `app_keys` and reapply the theme. The preceding JSON is retained privately as `backup/2026-10-26-before-wallpapers/config-before-settings-key.json`. Debugging remains enabled at the owner's request.
