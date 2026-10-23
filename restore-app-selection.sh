#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
: "${TV_HOST:?Set TV_HOST to the current TV address after re-enabling debugging}"
for list in device/08-remove-optional-cast-content.txt device/07-remove-optional-media.txt device/06-remove-streaming-b.txt device/05-remove-streaming-a.txt; do
  tools/restore.sh "$list" com.gathin.tvhome
done
tools/theme.sh device/before-app-selection
echo 'Optional apps and prior theme restored. Confirm Home and reboot.'
