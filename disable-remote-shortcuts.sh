#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
: "${TV_HOST:?Set TV_HOST to the current TV address}"
tools/venv/bin/python - <<'PY'
import importlib.util
import shlex
import time
spec = importlib.util.spec_from_file_location('tv', 'tools/tv.py')
tv = importlib.util.module_from_spec(spec)
spec.loader.exec_module(tv)
dev = tv.connect(20)
try:
    current = dev.shell('settings get secure enabled_accessibility_services').strip()
    ours = {'com.gathin.tvhome/.InputKeyService',
            'com.gathin.tvhome/com.gathin.tvhome.InputKeyService'}
    keep = [s for s in current.split(':') if s and s != 'null' and s not in ours]
    dev.shell('settings put secure enabled_accessibility_services ' + shlex.quote(':'.join(keep)))
    if not keep:
        dev.shell('settings put secure accessibility_enabled 0')
    time.sleep(2)
    print(dev.shell('settings get secure enabled_accessibility_services').strip())
    print('Netflix/YouTube key helper disabled. Other accessibility services were preserved.')
finally:
    dev.close()
PY
