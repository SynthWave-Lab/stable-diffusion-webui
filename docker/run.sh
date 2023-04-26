#!/usr/bin/env bash
set -Eeuo pipefail

if [ "$(which docker-compose)" ]; then
	compose='docker-compose'
else
	compose='docker compose'
fi
$compose down -v
$compose up -d

echo -e "\nWait for the UI to start then point your browser to: http://localhost:$(docker ps --format '{{.Names}} {{.Ports}}' | grep 'webui' | awk '{print $2}' | sed -n -e 's/^0.0.0.0:\([0-9]*\)->.*/\1/p'
) \n\n"
echo "To stop showing the logs precc CTRL-C"
$compose logs -f
