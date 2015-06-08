#!/bin/bash

HOME_ENABLE=1
OUTSIDE_ENABLE=1

HOME_SECONDS=900        # 15 minutes
OUTSIDE_SECONDS=300     # 5 minutes


SSID="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | sed -e "s/^  *SSID: //p" -e d)"
HOME_SSID="Bobbys"


AM_I_HOME=0

if [[ $SSID = $HOME_SSID ]]; then
    AM_I_HOME=1
fi

if [[ $AM_I_HOME = 1 ]]; then
    SECONDS=$HOME_SECONDS
    ENABLE=$HOME_ENABLE
else
    SECONDS=$OUTSIDE_SECONDS
    ENABLE=$OUTSIDE_ENABLE
fi


echo "am I home?             : $AM_I_HOME ($SSID = $HOME_SSID)"
echo "ask for password       : $ENABLE"
echo "ask for password after : $SECONDS"
defaults write com.apple.screensaver askForPassword $ENABLE
defaults -currentHost write com.apple.screensaver askForPasswordDelay -int $SECONDS
