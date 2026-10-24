# YouTube decoder recovery — 24 October 2026

YouTube opened its player but the video stayed black. The network was validated and the clock was correct; Private DNS was unset. This was a separate incident from the earlier Wi-Fi connection problem.

The Realtek codec service logged `Max instances(2,2)` and `InsufficientResources(0x80001000)`. Android's media resource manager showed one hardware video decoder held by the background FanCode process and another by YouTube. A Play key alone did not recover playback.

Ran `am force-stop com.fancode.tv` once, confirmed its decoder resource disappeared, then pressed OK on YouTube's selected Play control. The user confirmed: “yes yt working”. Screenshots before and after and the raw diagnostic logs remain private under `shots/` and `work/playback-incident/`.

No app was disabled, uninstalled, reset or updated. Accounts, saved data, DNS and network settings were unchanged. FanCode remains installed and can be opened normally. If this recurs, first back out of a playing video before changing apps; force-stop only the app verified to be retaining the decoder, or restart the TV if the codec service itself cannot recover. No automatic app killer was added to the launcher.
