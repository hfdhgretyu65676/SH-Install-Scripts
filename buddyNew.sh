#!/bin/bash
echo "Make sure you are connected to the device of your choice! Running 'adb devices' in 3 seconds..."
sleep 3
adb devices

echo "Running buddyNew.sh for mantis mouse pro in 3 seconds..."
sleep 3
echo "Running buddyNew.sh..."

adb shell "sh /sdcard/Android/data/app.mantispro.mousekeyboard/files/buddyNew.sh || exit 1" > /dev/null 2>&1
STATUS=$?

if [ "$STATUS" -ne 0 ]; then 
    echo "ERROR: Mantis Buddy failed to execute. (Exit code: $STATUS)"
    exit 1
else
    echo "Mantis buddy for mantis mouse pro is activated, have fun playing!"
    exit 0
fi
