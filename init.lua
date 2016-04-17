wifi.setmode(wifi.STATION)
ssid = "HomeChen(2.4G)"
password = "Chen23817212"
wifi.sta.config(ssid, password)
wifi.sta.autoconnect(1)
gpio.mode(7, gpio.INPUT)
gpio.mode(4, gpio.INPUT)
local IDLE_AT_STARTUP_MS = 100;
tmr.alarm(1,IDLE_AT_STARTUP_MS,1,function()
  read_value = {}
  while gpio.read(4)==1 do
    read_value[#read_value+1]=gpio.read(7)
    print(gpio.read(7))
    tmr.delay(10000)
  end
  read_value = nil
end)

print(wifi.ap.getip())
print(wifi.sta.getip())
print(read_value)
station = wifi.sta.getip()
srv = net.createServer(net.TCP)
srv:listen(80, function(conn)
    conn:on("receive", function(conn, payload)
        print(payload)
        conn:send("<h1>"+station+"</h1>")
    end)
    conn:on("sent", function(conn) conn:close() end)
end)
