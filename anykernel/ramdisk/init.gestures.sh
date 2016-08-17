#!/system/bin/sh


#####################
##  WAKE GESTURES  ##
#####################


# Enable wake gestures
chmod 666 /sys/android_touch/wake_gestures
echo 1 > /sys/android_touch/wake_gestures
chmod 644 /sys/android_touch/wake_gestures

# Disable double tap to wake
chmod 666 /sys/android_touch/doubletap2wake
echo 0 > /sys/android_touch/doubletap2wake
chmod 644 /sys/android_touch/doubletap2wake

# Disable sweep to sleep
chmod 666 /sys/android_touch/sweep2sleep
echo 0 > /sys/android_touch/sweep2sleep
chmod 644 /sys/android_touch/sweep2sleep

# Enable sweep to wake in up and down
chmod 666 /sys/android_touch/sweep2wake
echo 12 > /sys/android_touch/sweep2wake
chmod 644 /sys/android_touch/sweep2wake

# Enable camera gesture
chmod 666 /sys/android_touch/camera_gesture
echo 1 > /sys/android_touch/camera_gesture
chmod 644 /sys/android_touch/camera_gesture

# Set vibration strength at default 20 (34% in EXKM)
chmod 666 /sys/android_touch/vib_strength
echo 1 > /sys/android_touch/vib_strength
chmod 644 /sys/android_touch/vib_strength
