# FanCode decoder retention: controlled exit test — 24 October 2026

A controlled test on this TCL G07 / Android 11 confirmed that FanCode 3.1.1 retains a hardware video decoder even after leaving its player and confirming **Exit App**. This is a reproducible playback limitation, not a verified permanent repair.

## What was observed

1. Opened FanCode and used its existing **Continue Watching** entry. Confirmed `PlaybackComposeActivity` in the foreground, a started media AudioTrack belonging to FanCode, and hardware decoder resources owned by its process. The video path also allocated a software AVC decoder during the test.
2. Pressed Back from the player. The FanCode home screen returned, but its process still owned one `OMX.realtek.video.decoder` resource.
3. Pressed Back again, then selected **Exit App** in FanCode's confirmation dialog. FanCode's activity closed; its process and one hardware decoder remained. Waiting between checks did not release that resource.
4. Checked the official Play Store entry on the TV. It offered **Open** and **Uninstall**, with no **Update** button. Nothing was installed or uninstalled.
5. Ran `am force-stop com.fancode.tv` once. Its hardware decoder allocation disappeared. App data and sign-in were preserved. Started YouTube and a video; Android reported a started audio track owned by YouTube. The output screenshot was black, so picture/sound acceptance needs the owner's direct observation.

[FanCode's Exit App dialog](../verification/10-fancode-exit-dialog.jpg) is a real TV screenshot. Raw resource-manager, audio, activity and UI hierarchy captures remain private in `work/remote-investigation/`; full screenshots remain in `shots/`.

Earlier attempts were interrupted by app switches. A YouTube cast-library session appeared in logs, but the owner said nobody was casting. That log is not evidence that an external device caused the switch. The controlled test above establishes decoder retention without relying on that hypothesis.

## Practical limit and recovery

Back or Exit App alone is not a dependable way to free this FanCode allocation on the tested version. If another player turns black after FanCode, use TV Settings → Apps → FanCode → **Force stop**, then retry playback. Force stop preserves saved app data; do not choose Clear data, Uninstall or factory reset for this symptom. A TV restart is an alternative recovery.

No root, codec/system modification, automatic task killer, background restriction, replacement streaming app or new launcher permission was introduced for this test. The launcher cannot repair FanCode's closed-source player or guarantee daily streaming-service availability. Keep official app and firmware updates enabled. The remote Netflix/YouTube mapping fix and its successful power-cycle verification are separate, in checkpoint 21.

The owner subsequently confirmed that YouTube again has a moving picture and sound after FanCode was force-stopped. This verifies recovery, not a permanent repair. Network-ADB shutdown remains pending.
