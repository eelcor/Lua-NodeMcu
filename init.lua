print("MQTT test v0.1")
tmr.alarm(0,10000,0,function() dofile('mqtest.lua') end)
