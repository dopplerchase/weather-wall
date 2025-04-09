#!/bin/bash

# Array of URLs
URLS=("https://rammb-slider.cira.colostate.edu/?sat=goes-19&sec=full_disk&x=10112&y=7888&z=1&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://rammb-slider.cira.colostate.edu/?sat=goes-19&sec=conus&x=4984&y=5348&z=2&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&refresh=1&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://rammb-slider.cira.colostate.edu/?sat=goes-19&sec=mesoscale_01&x=964&y=946&z=1&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&refresh=1&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://rammb-slider.cira.colostate.edu/?sat=goes-19&sec=mesoscale_02&x=986&y=978&z=1&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://rammb-slider.cira.colostate.edu/?sat=goes-18&sec=full_disk&x=10112&y=7888&z=1&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&refresh=1&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://rammb-slider.cira.colostate.edu/?sat=goes-18&sec=conus&x=6164&y=3972&z=2&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&refresh=1&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://rammb-slider.cira.colostate.edu/?sat=goes-18&sec=mesoscale_01&x=998&y=990&z=1&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&refresh=1&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://rammb-slider.cira.colostate.edu/?sat=goes-18&sec=mesoscale_02&x=968&y=990&z=1&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&refresh=1&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6")

# Time between switching slides
WAIT_TIME=90

# Firefox settings
BROWSER="firefox-esr"
PROFILE_DIR="/tmp/kiosk-firefox-profile"
mkdir -p "$PROFILE_DIR"

# Loop through the URLs
while true; do
    for URL in "${URLS[@]}"; do
        # Launch Firefox in fullscreen with a temporary profile
        $BROWSER --new-instance --kiosk --profile "$PROFILE_DIR" "$URL" &
        PID=$!

        # Wait for the specified duration
        sleep "$WAIT_TIME"

        # Kill Firefox
        kill "$PID"
        sleep 3
    done
done
