#!/system/bin/sh


#########################
##  GOVERNOR SETTINGS  ##
#########################
# Deadpool by xperator
# Idea taken from frap129


########################
##  ONLINE ALL CORES  ##
########################
chmod 644 /sys/devices/system/cpu/online
echo 0-7 > /sys/devices/system/cpu/online
chmod 444 /sys/devices/system/cpu/online
echo 1 > /sys/devices/system/cpu/cpu0/online
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online
echo 1 > /sys/devices/system/cpu/cpu4/online
echo 1 > /sys/devices/system/cpu/cpu5/online
echo 1 > /sys/devices/system/cpu/cpu6/online
echo 1 > /sys/devices/system/cpu/cpu7/online


######################
##  LITTLE CLUSTER  ##
######################
# Governor: interactive
# Minimum frequency: 384MHz
# Maxixum frequency: 1708MHz
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 1708800 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

# Governor settings
echo 32 384000:52 460800:39 600000:46 672000:68 787200:30 864000:88 960000:97 1248000:95 1478000:100 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 460800 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 20000 460800:10000 600000:30000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 300 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 40000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boost
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis


###################
##  BIG CLUSTER  ##
###################
# Governor: interactive
# Minimum frequency: 633MHz
# Maxixum frequency: 2054MHz
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo 633600 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 2054400 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq

# Governor settings
echo 45 768000:45 864000:55 960000:77 1248000:75 1344000:80 1440000:94 1536000:96 1632000:99 1728000:99 1824000:100 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo 633600 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 40000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 50000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 300 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 50000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boost
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boostpulse_duration
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis


###################
##  INPUT BOOST  ##
###################
# 600MHz on little for 40ms
echo N > /sys/module/cpu_boost/parameters/sched_boost_on_input
echo N > /sys/module/cpu_boost/parameters/load_based_syncs
echo 15 > /sys/module/cpu_boost/parameters/migration_load_threshold
echo 0:600000 1:600000 2:600000 3:600000 4:0 5:0 6:0 7:0 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms
echo 0 > /sys/module/cpu_boost/parameters/sync_threshold


########################
##  THERMAL SETTINGS  ##
########################
# Core control disabled, msm_thermal enabled
echo 0 > /sys/module/msm_thermal/core_control/enabled
echo Y > /sys/module/msm_thermal/parameters/enabled
