#!/bin/sh

export PATH=/q/l64:$PATH

# KDB_LICENSE_B64 is used by registry.dl.kx.com/kxi-ml so we should follow that convention...
[ ! -f "$QLIC/kc.lic" ] && [ ! -z "$KDB_LICENSE_B64" ] && ( echo "$KDB_LICENSE_B64" | base64 -d > "$QLIC/kc.lic" )
[ ! -f "$QLIC/kc.lic" ] && echo "Warning: No licence file detected at $QLIC/kc.lic" >/dev/stderr 

echo "Command: $@" > /dev/stderr

exec "$@"
