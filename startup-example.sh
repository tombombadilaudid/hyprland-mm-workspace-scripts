#!/bin/bash

# Remove the previous log file, if it exists.
rm -f "$HOME/.config/hypr/startup-scripts/monitors-workspaces-startup.log"

# Declare the location of the new log file.
LOGFILE="$HOME/.config/hypr/startup-scripts/monitors-workspaces-startup.log"

# Function to log messages with timestamps
log_message() {
    echo "$(date +'%Y-%m-%d %H:%M:%S.%3N') - $1" >> "$LOGFILE"
}

# Create workspaces on the main monitor.
log_message "Creating workspace [2] on main monitor (DP-1)."
output=$(hyprctl dispatch workspace 2 || { echo "ERROR: Failed to assign workspace [2]."; })
log_message "$output"  # Log the output (including "ok")
log_message "Sleeping for 10 milliseconds."
sleep 0.01
log_message "Creating workspace [3] on main monitor (DP-1)."
output=$(hyprctl dispatch workspace 3 || { echo "ERROR: Failed to assign workspace [3]."; })
log_message "$output"
log_message "Sleeping for 10 milliseconds."
sleep 0.01
log_message "Moving back to workspace [1] (default) on main monitor (DP-1)."
output=$(hyprctl dispatch workspace 1 || { echo "ERROR: Transition to workspace [1] failed."; })
log_message "$output"
log_message "Sleeping for 10 milliseconds."
sleep 0.01

# Activate the top monitor..
log_message "Activating top monitor (DP-2)."
sudo /home/user/.config/hypr/startup-scripts/force-monitor-top.sh 
log_message "Sleeping for 100 milliseconds."
sleep 0.1

# Create workspaces on the top monitor.
log_message "Creating workspace [5] on top monitor (DP-2)."
output=$(hyprctl dispatch workspace 5 || { echo "ERROR: Failed to assign workspace [5]."; })
log_message "$output"
log_message "Sleeping for 10 milliseconds."
sleep 0.01
log_message "Creating workspace [6] on top monitor (DP-2)."
output=$(hyprctl dispatch workspace 6 || { echo "ERROR: Failed to assign workspace [6]."; })
log_message "$output"
log_message "Sleeping for 10 milliseconds."
sleep 0.01
log_message "Moving back to workspace [4] (default) on top monitor (DP-2)."
output=$(hyprctl dispatch workspace 4 || { echo "ERROR: Transition to workspace [4] (DP-2 default) failed."; })
log_message "$output"
log_message "Sleeping for 10 milliseconds."
sleep 0.01

# Activate the side monitor.
# log_message "Activating side monitor (DP-3)."
# sudo /home/user/.config/hypr/startup-scripts/force-monitor-side.sh
# log_message "Sleeping for 100 milliseconds."
# sleep 0.1

# Create workspaces on the side monitor.
# log_message "Creating workspace [8] on side monitor (DP-3)."
# output=$(hyprctl dispatch workspace 8 || { echo "ERROR: Failed to assign workspace [8]."; })
# log_message "$output"
# log_message "Sleeping for 10 milliseconds."
# sleep 0.01
# log_message "Creating workspace [9] on side monitor (DP-3)."
# output=$(hyprctl dispatch workspace 9 || { echo "ERROR: Failed to assign workspace [9]."; })
# log_message "$output"
# log_message "Sleeping for 10 milliseconds."
# sleep 0.01
# log_message "Moving back to workspace [7] (default) on side monitor (DP-3)."
# output=$(hyprctl dispatch workspace 7 || { echo "ERROR: Transition to workspace [7] (DP-3 default) failed."; })
# log_message "$output"
# log_message "Sleeping for 10 milliseconds."
# sleep 0.01

# Return to workspace 1 on the main monitor.
log_message "Returning to workspace [1] (default) on main monitor (DP-1)."
output=$(hyprctl dispatch workspace 1 || { echo "ERROR: Transition to workspace [1] (DP-1 default) failed."; })
log_message "$output"

log_message "Startup script completed successfully."
