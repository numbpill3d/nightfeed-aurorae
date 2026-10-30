#!/usr/bin/env bash
# Nightfeed — Aurorae Window Decoration — install.  ./install.sh
set -euo pipefail
HERE=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
DST=${XDG_DATA_HOME:-$HOME/.local/share}/aurorae/themes/Nightfeed
rm -rf "$DST"; mkdir -p "$DST"
cp "$HERE"/*.svg "$HERE"/Nightfeedrc "$HERE"/metadata.desktop "$DST"/
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key library org.kde.kwin.aurorae
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key theme __aurorae__svg__Nightfeed
qdbus6 org.kde.KWin /KWin reconfigure 2>/dev/null || true
