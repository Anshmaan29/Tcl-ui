# Regression QA — 24 October 2026

The owner requested reliability checks, then explicitly clarified that no extra parent-specific features should be added. This pass made no launcher, permission, app-data, network or background-process policy changes. It exercised the installed build and recorded the actual limitations instead of treating app launch as playback acceptance.

## Home and system

Rechecked the logo page after touring the selected apps, Down to the separate apps page, the short final row, horizontal boundaries, Back to the matching logo column, the rightmost logo boundary, top-bar boundary, Settings opening and Home return. Real TV captures are retained privately under `shots/qa-nav-*`. The first navigation press after idle gallery wakes the controls without moving focus, as designed. Earlier actual idle, reboot and wallpaper checks for this same build are recorded in checkpoint 20.

The InputKeyService remained bound with no crashed service entry after the app tour. Physical Netflix/YouTube buttons and held volume repeat were already accepted by the owner and survived the intervening power cycle (checkpoint 21). Internet remained Android-validated. The final resource-manager snapshot had no allocated video decoder; DRM sessions alone are not video decoder allocations. The available crash buffer contained an old firmware motionclient linker failure, with no launcher or toured-app crash recorded there. This finite check is not a guarantee against future app failures.

Launcher memory after the tour was 66,204 KB PSS and 7,062 KB swap PSS. Storage had approximately 4 GB free. These are snapshots, not a before/after performance improvement or an FPS claim. No additional feature, service, task killer or guide was installed.

## App inspection

Every selected app has a resolvable launch entry. Apps were allowed more time when the first capture showed only a splash screen. Full captures and UI hierarchies contain account information and remain private in `shots/` and `work/parent-qa/`.

| App | Observed result | Playback coverage |
|---|---|---|
| Netflix | Launches into its activity; capture is protected/empty | Owner's fresh playback check pending |
| Prime Video | Existing profile chooser loads | Owner's fresh playback check pending |
| YouTube | Account chooser and normal interface load | Owner confirmed picture and sound after decoder recovery |
| JioHotstar | Existing profile chooser loads | Owner's fresh playback check pending |
| Apple TV | Signed-in catalogue loads | Programme playback not independently verified in this pass |
| FanCode | Live player previously exercised; confirmed decoder leak after Back and Exit App | Live playback worked; switching reliability has a known failure (checkpoint 22) |
| ZEE5 | Catalogue loads after allowing additional time | Programme playback not independently verified |
| SonyLIV | Catalogue loads | Programme playback not independently verified |
| F1 TV | Sign-in/link-account screen loads after additional time | Requires owner sign-in; not verified |
| Spotify | Login screen loads | Requires owner sign-in; not verified |
| Airtel Xstream | Catalogue and existing continue-watching entries load | Programme playback not independently verified |
| YouTube Music | Opens YouTube's Music section with music catalogue | Expected redirect observed; music playback not independently verified |
| discovery+ | Foreground app displays its discontinuation notice and Continue action in the UI hierarchy; screenshot protected | App itself says it will be discontinued on 3 November 2026; playback not verified |

HDMI/tuner signal playback remains untested because no source is connected. Accounts, subscriptions and purchases were not changed to manufacture a playback pass.

The disabled count is now 21. Three previously disabled optional packages (MX Player, Viki and JioCinema) are no longer found by package-manager inspection; they were not re-enabled by this QA pass, and no uninstall was issued. The remaining disabled entries match the preceding snapshot. No action was taken against absent packages.

## Outstanding acceptance

FanCode's decoder retention remains reproducible and has only a verified recovery: Settings → Apps → FanCode → Force stop, or restart the TV. Back and Exit App do not reliably release it on the tested version. There is no verified permanent player fix, and app-wide daily reliability is not signed off.

Fresh Netflix/Prime/JioHotstar picture-and-sound confirmation, and the final revoke/debugging-off/restart/explicit port-refusal check, remain pending. No claim that all apps or network ADB passed should be inferred from this checkpoint.
