#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
: "${TV_HOST:?Set TV_HOST to the current TV address}"
export JAVA_HOME="${JAVA_HOME:-/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home}"
export ANDROID_HOME="${ANDROID_HOME:-/Users/anshmaansingh/tv/work/android-sdk}"
export GRADLE_USER_HOME="${GRADLE_USER_HOME:-/Users/anshmaansingh/tv/work/gradle-cache}"
# Preserve stock launcher during installation. Handover is a separately verified step.
STOCK_LAUNCHER=none launcher/build-and-install.sh
tools/theme.sh device/doctor-doom
tools/venv/bin/python tools/tv.py --screenshot shots/reinstalled-doctor-doom.png
echo 'Launcher installed and theme applied. Stock Home is not disabled by this script.'
echo 'For initial handover, inspect HOME/Wi-Fi owners and screenshots before tools/disable.sh device/04-home-handover.txt.'
