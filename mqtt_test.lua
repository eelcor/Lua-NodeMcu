m = net.createConnection(net.TCP, 0)
mqtt:mqtt("Beestje_ESP", 30, "", "")
gpio.mode(4,gpio.OUTPUT)
gpio.write(4,gpio.LOW)

mqtt:on("receive", function(conn, topic, data)
  print(topic) 
  if topic == 'button' then
    if data == 'on' then
      gpio.write(4,gpio.HIGH)
    end
    if data == 'off' then
      gpio.write(4,gpio.LOW)
    end
  end
end)

mqtt:on("sent", function(con) print("sent") end)
mqtt:on("connection", function(con) dofile("first_connect.lua") end)
mqtt:on("disconnection", function(con) print("disconnected") end)
mqtt:on("reconnection", function(con) print("reconnect") end)
print("Connecting...")
mqtt:connect(1883,"10.0.0.112")
print(node.heap())
                                               