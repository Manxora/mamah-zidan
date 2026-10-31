#!/data/data/com.termux/files/usr/bin/bash
# Menjalankan website toko di Termux
cd "$(dirname "$0")"
command -v python >/dev/null || pkg install python -y
echo "Toko jalan di: http://localhost:8080"
echo "Dari HP lain (satu WiFi): http://$(ifconfig 2>/dev/null | grep -oE 'inet 192\.168\.[0-9.]+|inet 10\.[0-9.]+' | head -1 | cut -d' ' -f2):8080"
echo "Tekan Ctrl+C untuk berhenti."
(sleep 2; termux-open-url http://localhost:8080) 2>/dev/null &
python -m http.server 8080
