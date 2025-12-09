#!/bin/bash
# ~/.config/hypr/scripts/fake-fullscreen-listener.sh

handle() {
    case $1 in
        fullscreen*) 
            state="${1##*>>}"
            if [ "$state" = "1" ]; then
                # Window just went fullscreen - convert to fake fullscreen
                hyprctl dispatch fullscreenstate 0 2
            fi
            ;;
    esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
    handle "$line"
done
