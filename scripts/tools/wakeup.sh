#!/bin/bash
# wakeup - @humbertowoody
# Wakeup our LAN NAS/Server (whith a hardcoded local mac address) or any device
# with enabled wol capability to be powered on.

# MAC Addresses constants.
MAC_ADDRESS_DELL_WINDOWS=84:2b:2b:a2:1c:f7
MAC_ADDRESS_ALCOCERSERVER=00:21:9b:0c:21:5d

# Function definition
function wakeup()
{
  local deviceMacAddress=${1:-00:21:9b:0c:21:5d}
  wakeonlan $deviceMacAddress
}

# I own a Synology NAS
# To use the wakeup function from within the DSM, the command would
# be:
#   sudo synonet --wake [MAC Address] [interface]
# example:
#   sudo synonet --wake 84:2b:2b:a2:1c:f7 bond0

