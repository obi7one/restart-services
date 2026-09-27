#!/usr/bin/osascript

-- Let user choose the service (Bluetooth, Network, Finder, or Dock)
set serviceList to {"Bluetooth", "Network", "Finder", "Dock"}
set chosenService to choose from list serviceList with prompt "Which service would you like to restart?" default items {"Bluetooth"}

if chosenService is false then
    -- User clicked cancel
    return
end if

set choice to item 1 of chosenService

-- Determine the current Wi-Fi interface
try
    set wifiInterface to do shell script "/usr/sbin/networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $2}'"
on error
    display dialog "Failed to detect Wi-Fi interface." buttons {"OK"} default button "OK"
    return
end try

-- Define shell commands
set bluetoothCmd to "/usr/bin/sudo /usr/bin/killall bluetoothd"
set networkDownCmd to "/usr/bin/sudo /sbin/ifconfig " & wifiInterface & " down"
set networkUpCmd to "/usr/bin/sudo /sbin/ifconfig " & wifiInterface & " up"
set finderCmd to "killall Finder"
set dockCmd to "killall Dock"

-- Perform the selected action
try
    if choice is "Bluetooth" then
        do shell script bluetoothCmd with administrator privileges
        display notification "Bluetooth service restarted" with title "Service Manager"

    else if choice is "Network" then
        do shell script networkDownCmd with administrator privileges
        do shell script networkUpCmd with administrator privileges
        display notification "Network service restarted (" & wifiInterface & ")" with title "Service Manager"

    else if choice is "Finder" then
        do shell script finderCmd
        display notification "Finder restarted" with title "Service Manager"

    else if choice is "Dock" then
        do shell script dockCmd
        display notification "Dock restarted" with title "Service Manager"
    end if

on error errMsg number errNum
    display dialog "Error: " & errMsg & " (code " & errNum & ")" buttons {"OK"} default button "OK"
end try
