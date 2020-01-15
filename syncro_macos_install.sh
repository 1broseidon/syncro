#!/bin/bash

#
# Syncro MacOS Silent Install
# Written by George Dikeakos @ Leveldesk
# https://leveldesk.com
#

KEY="INSERT SITE KEY HERE"

#Download latest MacOS Agent
curl -O https://production.kabutoservices.com/macos/SyncroAgent-Latest.zip

#Temporarily disable Gatekeeper
spctl --master-disable

#Unzip and move agent application to Applications folder
unzip -qq SyncroAgent-Latest.zip
mv SyncroAgent.app/ /Applications/

#Add agent and helpers to Gatekeeper whitelist
spctl --add /Applications/SyncroAgent.app
spctl --add /Applications/SyncroAgent.app/Contents/Resources/smartctl
spctl --add /Applications/SyncroAgent.app/Contents/Resources/syncroHelper

/Applications/SyncroAgent.app/Contents/MacOS/SyncroAgent -key $KEY

#Reenable Gatekeeper
spctl --master-enable

#Cleanup zip files
rm -rf SyncroAgent-Latest.zip
