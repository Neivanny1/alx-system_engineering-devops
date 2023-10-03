#!/usr/bin/env ruby
# log file analysing 
puts ARGV[0].scan(/(?<=from:|to:|flags:).+?(?=\])/).join(",")
