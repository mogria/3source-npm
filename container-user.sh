#!/bin/sh
uid="$RUN_AS"

if [ "$uid" -eq 0 ]; then
    echo "warning: no UID specified with -e RUN_AS=\$UID, using default 0, running as root"
    user=root
else
    user=generic-user
    addgroup --gid "$uid" "$user" > /dev/null
    useradd -m --gid "$uid" --uid "$uid" "$user" > /dev/null
fi

if [ -z "$1" ]; then
    echo "no command given, running /bin/sh"
    gosu "$user" /bin/sh
else
    gosu "$user" "$@"
fi
