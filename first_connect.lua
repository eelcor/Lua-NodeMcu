m:subscribe("button",0, function(conn) print("subscribe success") end)

counter = 0
delay = 0
gpio.mode(3,gpio.INT)

function count_up()
  x = tmr.now()
  if x > delay then
    delay = tmr.now()+250000
    counter = counter + 1
    m:publish("energy",counter,0,0)
    print(counter)
  end
end
gpio.trig(3, "up", count_up)
