--init.lua
wifi.setmode(wifi.STATION)
wifi.sta.config("APNAME","password")
wifi.sta.connect()
tmr.alarm(1, 1000, 1, function()
if wifi.sta.getip()== nil then
	print("Waiting for IP...")
else
	tmr.stop(1)
    print("Your IP is "..wifi.sta.getip())
    print("5 seconds to stop timer 0")
    tmr.alarm(0, 5000, 0, function()
        print("Starting button listener...")
        dofile("button.lua")
    end)
end
end)