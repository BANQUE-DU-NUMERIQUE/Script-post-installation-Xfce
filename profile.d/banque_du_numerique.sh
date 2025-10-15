#!/bin/bash

SOURCE_DIR="/usr/share/banque du numérique/desktop"
USER_DIR="$HOME/Bureau"

[ -d "$USER_DIR" ] || exit 0

for file in "$USER_DIR"/*.desktop; do
    filename=$(basename "$file")
    source_file="$SOURCE_DIR/$filename"
    if [ -f "$source_file" ]; then
        source_checksum=$(sha256sum "$source_file" | awk '{print $1}')
        user_checksum=$(sha256sum "$file" | awk '{print $1}')
        if [ "$source_checksum" == "$user_checksum" ]; then
            xfce_checksum=$(gio info "$file" -a metadata::xfce-exe-checksum | grep "metadata::xfce-exe-checksum" | awk '{print $2}')
            if [ "$xfce_checksum" != "$user_checksum" ]; then
                gio set -t string "$file" metadata::xfce-exe-checksum "$user_checksum"
            fi
        fi
    fi
done
