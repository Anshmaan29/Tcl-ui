#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
: "${TV_HOST:?Set TV_HOST to the current TV address after re-enabling debugging}"
PY=tools/venv/bin/python
[[ -x "$PY" ]] || { echo "Create tools/venv and install tools/requirements.txt first."; exit 1; }
# Bring back the known original launcher before changing Home; never touch the three factory-disabled apps.
"$PY" tools/tv.py 'pm enable --user 0 com.google.android.apps.tv.launcherx'
"$PY" tools/tv.py 'pm enable --user 0 com.google.android.tungsten.setupwraith'
for list in device/08-remove-optional-cast-content.txt device/07-remove-optional-media.txt device/06-remove-streaming-b.txt device/05-remove-streaming-a.txt device/03-promotions-autoinstall.txt device/02-content-messages.txt device/01-cleaner-feedback.txt; do
  tools/restore.sh "$list" com.google.android.apps.tv.launcherx
done
"$PY" tools/tv.py 'cmd package set-home-activity --user 0 com.google.android.apps.tv.launcherx/.home.HomeActivity'
./disable-remote-shortcuts.sh
"$PY" tools/tv.py 'input keyevent KEYCODE_HOME'
"$PY" tools/tv.py --screenshot shots/restored-stock-home.png
"$PY" tools/tv.py 'pm list packages -d'
echo 'Stock Home restored. Custom launcher stays installed; no app data was erased. Reboot and verify.'
