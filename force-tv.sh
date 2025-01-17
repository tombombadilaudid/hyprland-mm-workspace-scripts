cat UN58MU6070-HDMI-A-1.bin > /sys/kernel/debug/dri/0/HDMI-A-1/edid_override
echo on > /sys/kernel/debug/dri/1/HDMI-A-1/force
echo 1 > /sys/kernel/debug/dri/1/HDMI-A-1/trigger_hotplug
