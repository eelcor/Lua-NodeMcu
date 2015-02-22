gpio.mode(5,gpio.OUTPUT)
gpio.write(5,gpio.LOW)
m = mqtt.Client("clientid", 120, "", "")
m:lwt("/lwt", "offline", 0, 0)
m:on("connect", function(con) print ("connected") end) 
m:on("offline", function(con) print ("offline") end)
m:on("message", function(conn, topic, data)
  print(topic) 
  if topic == 'button' then
    if data == 'on' then
      gpio.write(5,gpio.HIGH)
    end
    if data == 'off' then
      gpio.write(5,gpio.LOW)
    end
  end
end)
m:connect("10.0.0.112", 1883, 0, function(conn) print("connected") end)
tmr.alarm(0,3000,0,function() dofile('first_connect.lua') end)
