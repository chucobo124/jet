require 'serialport'
# command line format pushfile.rb [init.lua(open file)] [init.lua(destination name)]
infilename=ARGV[0]
outfilename = infilename
if ARGV.size > 1
  outfilename = ARGV[1]
end
connection = SerialPort.new("/dev/tty.Repleo-PL2303-00002014" , 9600 )
connection.print("file.remove(\"#{outfilename}\")")
connection.print("file.open(\"#{outfilename}\", \"w+\")\r")
file=File.open(infilename)
puts "file.open(\"#{outfilename}\",\"w\")"
sleep 0.2
file.readlines.each do |line|
  command="file.writeline(\"#{line.gsub(/[\"]/, "\\\"").gsub(/^\s*/,"")}\")"
  sleep 0.1
  connection.print("#{command.to_s}\r")
  puts command
  sleep 0.005*command.size + 0.1    # wait for serial port and esp8266 processing the command
end
puts "file.close()"
connection.print("file.close()\r")
sleep 0.1
puts "node.restart()"
connection.print("node.restart()\r")
