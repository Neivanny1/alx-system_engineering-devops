#!/usr/bin/env ruby
# Accepts one arg and pass it to regular expression
puts ARGV[0].scan(/hb{0,1}tn/).join
