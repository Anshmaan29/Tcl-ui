#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
: "${TV_HOST:?Set TV_HOST to the current TV address}"
# Restore the four-column banner design while preserving the wallpaper rotation and app choices.
tools/theme.sh device/before-logo-dock
tools/venv/bin/python tools/tv.py --screenshot shots/restored-banner-dock.png HOME
