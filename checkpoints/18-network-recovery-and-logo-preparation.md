# Network recovery and logo design preparation

The owner reported playback errors across streaming apps. Their TV photo showed strong Wi-Fi with an IP address but Android's “No Internet” status. Before any new design was installed, toggling Wi-Fi off for ten seconds and reconnecting restored internet and playback, confirmed by the owner. ADB also became reachable again. No app data, accounts, DNS or package states were changed to repair it.

The owner approved the floating five-logo favourites row, icon-only controls, quieter lower grid and idle gallery. The app priority and four backgrounds are preserved. The previous theme is saved in `device/before-logo-dock/`, and the APK plus complete package/settings/getprop/network baseline are retained privately in `backup/2026-10-24-before-logo-dock/`. All 24 disabled packages remain as before. No accessibility helpers are enabled.

The design uses external small transparent logo files; the Apple TV artwork comes from the owner's supplied image. The background remains one decoded image at a time. Gallery mode uses a Home-only delayed callback after 120 seconds, hides the controls with a brief transition, and reuses the current wallpaper with a small clock. Navigation wakes it without launching an app; volume is passed through. No new permissions, services, network features or launcher dependencies were added. The original APK size limit and package/Home safety guards remain unchanged.

Baseline measurement: launcher PSS 93 MB and sampled idle launcher CPU 0%. This firmware did not expose usable frame timestamps in the benchmark (12 key samples lost); its frame/jank/latency numbers are unavailable, not zero. The one baseline cold-start sample was 1,385 ms; it is too small a sample for a performance guarantee. Raw measurements stay private under `work/perf-before-logo/` because they include network and device details.

Build, on-device installation, visual checks and the idle/wake test follow before the final design is handed over.
