# jet

The Wifi program with Node MCU in Python upload tool.  

# Install Python
1. Install brew
2. brew install python

# How to upload Program to device
1. This is a sample of upload code

```
./luatool.py --port /dev/ttyUSB0 --src init.lua --dest init.lua --verbose
```
When cmplete the upload will auto restart node.(AReady edit in the lua)

# How to get into the chip
Use Screen command line or any kind of Gui serial port monitor to get into chip.The chip's baud rate is 9600 so we will use screen command line to get into the chip.
```
screen /dev/cu.usbserial 115200
```
If you can't access to chip which means you haven't install the driver. You can get the driver in the Repo or go to  visit the [offical web site](http://www.prolific.com.tw/US/ShowProduct.aspx?p_id=229&pcid=41) to get the newest version.

# Node MCU
[Node MCU function library ](https://github.com/nodemcu/nodemcu-firmware/wiki/nodemcu_api_en)

Node MCU base on [Lua](http://www.lua.org/). It's easier and lightweight language makes you quickly to be familiar in program logic. 
