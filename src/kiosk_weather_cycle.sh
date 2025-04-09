#!/bin/bash

# Array of weather URLs
URLS=(
  "https://rammb-slider.cira.colostate.edu/?sat=goes-19&sec=conus&motion=loop&speed=80&pause=0&hide_controls=1"
  "https://rammb-slider.cira.colostate.edu/?sat=goes-18&sec=full_disk&motion=loop&speed=80&pause=0&hide_controls=1"
  "https://rammb-slider.cira.colostate.edu/?sat=goes-19&sec=mesoscale_01&motion=loop&speed=80&pause=0&hide_controls=1"
)

# Time to wait per slide
WAIT_TIME=90

# Launch Chromium once
chromium --kiosk "about:blank" &
CHROME_PID=$!

# Wait for window to open
sleep 5

# Get Chromium window ID
WINDOW_ID=""
while [ -z "$WINDOW_ID" ]; do
  WINDOW_ID=$(xdotool search --onlyvisible --class "chromium")
  sleep 1
done

# Cycle through URLs
while true; do
  for URL in "${URLS[@]}"; do
    # Focus Chromium window
    xdotool windowactivate "$WINDOW_ID"
    
    # Open new URL (Ctrl+L, then type, then Enter)
    xdotool key ctrl+l
    sleep 0.2
    xdotool type "$URL"
    sleep 0.2
    xdotool key Return

    # Wait
    sleep "$WAIT_TIME"
  done
done
