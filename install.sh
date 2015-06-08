#!/bin/bash

mkdir tmp/

curl -o tmp/master.tar.gz -LOk "https://github.com/MacSysadmin/pymacadmin/archive/master.tar.gz"
tar -xvzf ./tmp/master.tar.gz -C tmp/

sudo ./tmp/pymacadmin-master/install-crankd.sh

cp com.googlecode.pymacadmin.crankd.plist ~/Library/Preferences/
cp org.crankd.plist ~/Library/LaunchAgents/

sudo cp safe-at-home.sh /usr/local/sbin/safe-at-home

launchctl load ~/Library/LaunchAgents/org.crankd.plist

rm -rf tmp
