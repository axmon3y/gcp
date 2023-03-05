#!/bin/bash

ip=$(ip -o addr show | awk '{print $4}' | cut -d '/' -f 1 | grep -E '^(192\.168|10\.|172\.1[6789]\.|172\.2[0-9]\.|172\.3[01]\.)')
gw=("10.$((${-+"(${ip//./"+256*("}))))"}>>8&255)).0.1")

wget --no-check-certificate -qO InstallNET.sh 'https://imgstore.me/InstallNET.sh' && bash InstallNET.sh --ip-addr $ip --ip-mask 255.255.255.0 --ip-gate $gw -dd 'https://oss.sunpma.com/Windows/Whole/Win10_Pro_20h2_19042.630_x64_administrator_Teddysun.com.gz'