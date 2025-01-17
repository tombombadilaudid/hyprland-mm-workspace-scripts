cat C27F390-DP2.bin > /sys/kernel/debug/dri/0/DP-2/edid_override
echo on > /sys/kernel/debug/dri/1/DP-2/force
echo 1 > /sys/kernel/debug/dri/1/DP-2/trigger_hotplug
