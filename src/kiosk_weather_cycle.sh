#!/bin/bash

# Array of weather URLs to cycle through
URLS=(
  "https://rammb-slider.cira.colostate.edu/?sat=goes-19&sec=conus&motion=loop&speed=80&pause=0&hide_controls=1"
  "https://rammb-slider.cira.colostate.edu/?sat=goes-18&sec=full_disk&motion=loop&speed=80&pause=0&hide_controls=1"
  "https://rammb-slider.cira.colostate.edu/?sat=goes-19&sec=mesoscale_01&motion=loop&speed=80&pause=0&hide_controls=1"
)

WAIT_TIME=90  # seconds to wait before switching

# Launch Chromium in kiosk mode with a blank page
chromium --kiosk "about:blank" --user-data-dir=/tmp/kiosk-data &

# Save the PID
CHROME_PID=$!

# Wait for the Chromium window to appear
echo "Waiting for Chromium to launch..."
WINDOW_ID=""
for i in {1..15}; do
  WINDOW_ID=$(xdotool search --onlyvisible --class chromium | head -n 1)
  if [ -n "$WINDOW_ID" ]; then
    break
  fi
  sleep 1
done

if [ -z "$WINDOW_ID" ]; then
  echo "❌ Failed to find Chromium window. Exiting."
  exit 1
fi

echo "✅ Chromium window found: $WINDOW_ID"

# Main loop to cycle through URLs
while true; do
  for URL in "${URLS[@]}"; do
    echo "🔁 Loading: $URL"

    # Bring Chromium to the front
    xdotool windowactivate "$WINDOW_ID"
    sleep 0.5

    # Focus address bar and enter URL
    xdotool key ctrl+l
    sleep 0.3
    xdotool type "$URL"
    sleep 0.3
    xdotool key Return

    sleep "$WAIT_TIME"
  done
done
