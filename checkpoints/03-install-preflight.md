# APK installation preflight

Before building the launcher, copied the TV's already-installed TCL Message Box APK to a temporary installer path, verified matching MD5s, and ran `pm install -r` in its own shell call. Result: **Success**. Existing app data preserved; no new unrelated app introduced. Removed the temporary file. This verifies general APK installation; acceptance of a third-party HOME activity still requires installing and starting our build.

Updated only the launcher configuration: TCL Live TV package is `com.tcl.tv`; hide duplicate source/Live TV tiles and TCL account/reminder tiles. Retained four-slot dock, current target SDK 34/minSdk 26 and Android 11 leanback package-visibility declarations. The owner's static wallpaper is applied through the theme; no blur or video.
