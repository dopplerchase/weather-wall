#!/bin/bash

# Array of URLs
URLS=("https://rammb-slider.cira.colostate.edu/?sat=goes-19&sec=full_disk&x=10112&y=7888&z=1&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://rammb-slider.cira.colostate.edu/?sat=goes-19&sec=conus&x=4984&y=5348&z=2&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&refresh=1&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://rammb-slider.cira.colostate.edu/?sat=goes-19&sec=mesoscale_01&x=964&y=946&z=1&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&refresh=1&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://rammb-slider.cira.colostate.edu/?sat=goes-19&sec=mesoscale_02&x=986&y=978&z=1&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://rammb-slider.cira.colostate.edu/?sat=goes-18&sec=full_disk&x=10112&y=7888&z=1&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&refresh=1&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://rammb-slider.cira.colostate.edu/?sat=goes-18&sec=conus&x=6164&y=3972&z=2&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&refresh=1&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://rammb-slider.cira.colostate.edu/?sat=goes-18&sec=mesoscale_01&x=998&y=990&z=1&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&refresh=1&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://rammb-slider.cira.colostate.edu/?sat=goes-18&sec=mesoscale_02&x=968&y=990&z=1&angle=0&im=12&ts=1&st=0&et=0&speed=130&motion=loop&refresh=1&maps%5Bborders%5D=white&p%5B0%5D=geocolor&opacity%5B0%5D=1&pause=0&slider=-1&hide_controls=1&mouse_draw=0&follow_feature=0&follow_hide=0&s=rammb-slider&draw_color=FFD700&draw_width=6" \
"https://radar.weather.gov/?settings=v1_eyJhZ2VuZGEiOnsiaWQiOiJuYXRpb25hbCIsImNlbnRlciI6Wy05OS42MzgsMzkuMjIzXSwibG9jYXRpb24iOm51bGwsInpvb20iOjUuMTA5OTk5OTk5OTk5OTk5LCJsYXllciI6ImJyZWZfcWNkIn0sImFuaW1hdGluZyI6dHJ1ZSwiYmFzZSI6InRvcG9ncmFwaGljIiwiYXJ0Y2MiOmZhbHNlLCJjb3VudHkiOmZhbHNlLCJjd2EiOmZhbHNlLCJyZmMiOmZhbHNlLCJzdGF0ZSI6ZmFsc2UsIm1lbnUiOnRydWUsInNob3J0RnVzZWRPbmx5Ijp0cnVlLCJvcGFjaXR5Ijp7ImFsZXJ0cyI6MC44LCJsb2NhbCI6MC42LCJsb2NhbFN0YXRpb25zIjowLjgsIm5hdGlvbmFsIjowLjY5fX0%3D" \
"https://radar.weather.gov/?settings=v1_eyJhZ2VuZGEiOnsiaWQiOiJsb2NhbCIsImNlbnRlciI6Wy0xMTIuMTAzLDM5LjY3XSwibG9jYXRpb24iOm51bGwsInpvb20iOjcuMzc2NjY2NjY2NjY2NjY2LCJmaWx0ZXIiOm51bGwsImxheWVyIjoiYnJlZmwiLCJzdGF0aW9uIjoiVFNMQyJ9LCJhbmltYXRpbmciOnRydWUsImJhc2UiOiJ0b3BvZ3JhcGhpYyIsImFydGNjIjpmYWxzZSwiY291bnR5IjpmYWxzZSwiY3dhIjpmYWxzZSwicmZjIjpmYWxzZSwic3RhdGUiOmZhbHNlLCJtZW51Ijp0cnVlLCJzaG9ydEZ1c2VkT25seSI6dHJ1ZSwib3BhY2l0eSI6eyJhbGVydHMiOjAuOCwibG9jYWwiOjAuNiwibG9jYWxTdGF0aW9ucyI6MC44LCJuYXRpb25hbCI6MC42OX19" \
"https://radar.weather.gov/?settings=v1_eyJhZ2VuZGEiOnsiaWQiOiJsb2NhbCIsImNlbnRlciI6Wy03OC43NCw0Mi42NDJdLCJsb2NhdGlvbiI6bnVsbCwiem9vbSI6Ny45MDY2NjY2NjY2NjY2NjQ1LCJmaWx0ZXIiOm51bGwsImxheWVyIjoic3JfYnJlZiIsInN0YXRpb24iOiJLQlVGIn0sImFuaW1hdGluZyI6dHJ1ZSwiYmFzZSI6InRvcG9ncmFwaGljIiwiYXJ0Y2MiOmZhbHNlLCJjb3VudHkiOmZhbHNlLCJjd2EiOmZhbHNlLCJyZmMiOmZhbHNlLCJzdGF0ZSI6ZmFsc2UsIm1lbnUiOnRydWUsInNob3J0RnVzZWRPbmx5Ijp0cnVlLCJvcGFjaXR5Ijp7ImFsZXJ0cyI6MC44LCJsb2NhbCI6MC42LCJsb2NhbFN0YXRpb25zIjowLjgsIm5hdGlvbmFsIjowLjY5fX0%3D" \
)

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
