#!/bin/bash
# wakeup - @humbertowoody
# Wakeup our LAN NAS/Server (whith a hardcoded local mac address) or any device
# with enabled wol capability to be powered on.

 function wakeup()
 {
   local deviceMacAddress=${1:-00:21:9b:0c:21:5d}
   wakeonlan $deviceMacAddress
 }
