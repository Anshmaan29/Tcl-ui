#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
: "${TV_HOST:?Set TV_HOST to the current TV address}"
# Restore the previous single Doctor Doom picture, preserving Home and the chosen app order.
tools/theme.sh device/before-wallpaper-gallery
tools/venv/bin/python tools/tv.py --screenshot shots/restored-single-wallpaper.png HOME
