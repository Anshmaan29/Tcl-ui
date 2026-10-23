# Wallpaper gallery

Four owner-supplied backgrounds, used locally with no downloads or network permission:

1. `01-doctor-doom.jpg`: the original Doctor Doom image, unchanged.
2. `02-racing.jpg`: rain/Red Bull driver, rotated 90 degrees counterclockwise.
3. `03-spider-man.jpg`: Spider-Man, rotated 90 degrees counterclockwise.
4. `05-warrior.jpg`: blue warrior/army image, fitted to 16:9.

The new images were fitted locally with Pillow after the owner's explicit approval, using proportional scaling and centered cropping, without generated artwork. Their originals remain in Downloads. All prepared images are 1600×900 and below 210 KB each. The root `wallpaper.jpg` remains the original single-image fallback. Batman was removed from the active folder and TV at the owner’s request; it remains recoverable in Git history and the private backup.

The theme advances in filename order on each detected standby wake or cold boot, wrapping after four images. Timed changes are off. Returning from an app keeps the current background. A fixed picture selected in Launcher settings overrides this gallery until the theme is reapplied. Turn `wallpaper_change_on_wake` off and push the theme to return to the single-image fallback, or run `restore-wallpaper-gallery.sh`.
