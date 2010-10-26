# client.rb
# Created Oct. 25, 2010
# Part of ahk_drb_test - a demonstration of how to call AHK code from Ruby,
# and Ruby code from AHK, using DRb.
# Licensed under the GNU GPL v2.

require 'drb/drb'

uri = 'druby://localhost:8787'
DRb.start_service
server = DRbObject.new_with_uri(uri)

server.send ARGV[0]
