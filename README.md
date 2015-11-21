# jet

The Wifi program with Node MCU in Python upload tool.  

#Install Python
1. Install brew
2. brew install python

#How to upload Program to device
1. This is a sample of upload code
```
./luatool.py --port /dev/ttyUSB0 --src init.lua --dest init.lua --verbose
```
When cmplete the upload will auto restart node.(AReady edit in the lua)
