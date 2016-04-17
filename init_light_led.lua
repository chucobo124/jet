cfg={}
cfg.ssid="GW2FESP"
cfg.pwd="1234567890"
wifi.setmode(wifi.STATIONAP)
wifi.ap.config(cfg)
print(wifi.ap.getip())
led=4
gpio.mode(led,gpio.OUTPUT)
srv=net.createServer(net.TCP)
srv:listen(4000,function(c)
					c:on("receive",function(c,pl)
					print(pl)
					if pl == "on" then
				      gpio.write(led,gpio.HIGH)
					elseif pl =="close" then
					  gpio.write(led,gpio.LOW)
					 end
					 c:send("successful")
					end)
         end)
function list()
	l = file.list()
	for k,v in pairs(l) do
	  print("name:"..k..",size:"..v)
	end
end
