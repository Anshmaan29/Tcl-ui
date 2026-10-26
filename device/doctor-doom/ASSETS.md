# Wallpaper gallery

Eight owner-supplied backgrounds, used locally with no downloads or network permission:

1. `01-doctor-doom.jpg`: the original Doctor Doom image, unchanged.
2. `02-racing.jpg`: rain/Red Bull driver, rotated 90 degrees counterclockwise.
3. `03-spider-man.jpg`: Spider-Man, rotated 90 degrees counterclockwise.
4. `05-warrior.jpg`: blue warrior/army image, fitted to 16:9.
5. `06-batman-fire.jpg`: new Batman/fire image supplied on 26 October.
6. `07-soldier.jpg`: black tactical soldier.
7. `08-loki.jpg`: green Loki artwork.
8. `09-moon-knight.jpg`: Moon Knight in warm gold light.

The four additions were rotated 90 degrees counterclockwise and proportionally fitted to 16:9. They total 759,202 bytes; only the current image is decoded by the existing wallpaper player.

The new images were fitted locally with Pillow after the owner's explicit approval, using proportional scaling and centered cropping, without generated artwork. Their originals remain in Downloads. All prepared images are 1600×900 and below 270 KB each. The root `wallpaper.jpg` remains the original single-image fallback. The earlier red Batman image was removed from the active folder and TV at the owner’s request; it remains recoverable in Git history and the private backup.

The theme advances in filename order on each detected standby wake or cold boot, wrapping after eight images. At the owner’s choice, it also advances every 10 minutes while Home is visible. Rotation pauses while another app is in front; returning Home may advance if the saved change time is more than 10 minutes old. A fixed picture selected in Launcher settings overrides this gallery until the theme is reapplied. Turn `wallpaper_change_on_wake` off and push the theme to return to the single-image fallback, or run `restore-wallpaper-gallery.sh`.
