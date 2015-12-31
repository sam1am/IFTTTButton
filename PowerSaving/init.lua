--init.lua

gpio.mode(4, gpio.OUTPUT)
gpio.write(4, gpio.HIGH)
cnt = 0

print("Starting SmartButton")

wifi.setmode(wifi.STATION)
wifi.sta.config("APNAME","password")
wifi.sta.connect()

tmr.alarm(1, 1000, 1, function()
if wifi.sta.getip()== nil then
    cnt = cnt + 1
	print("(" .. cnt .. ") Waiting for IP...")
    if cnt == 10 then
        tmr.stop(1)
        dofile("setwifi.lua")
    end
else
	tmr.stop(1)
    dofile("ifttt.lua")
end
end)