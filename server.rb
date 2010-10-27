# server.rb
# Created Oct. 25, 2010
# Part of ahk_drb_test - a demonstration of how to call AHK code from Ruby,
# and Ruby code from AHK, using DRb.
# Licensed under the GNU GPL v2.

require 'drb/drb'
require 'WIN32OLE'

class MyService
  def initialize
    # Make an AHK instance to use for our message boxes
    @output_ahk = WIN32OLE.new('AutoHotkey.Script')
    @output_ahk.ahkTextDll('')
    @output_ahk.addScript('#NoTrayIcon')
  end

  def win_ctrl_a
    message = 'MsgBox You pressed Win+Ctrl+A.'
    puts message
    @output_ahk.ahkExec("MsgBox #{message}")
  end

  def win_ctrl_b
    message = 'MsgBox You pressed Win+Ctrl+B.'
    puts message
    @output_ahk.ahkExec("MsgBox #{message}")
  end

  def win_ctrl_c
    message = 'MsgBox You pressed Win+Ctrl+C.'
    puts message
    @output_ahk.ahkExec("MsgBox #{message}")
  end

  def win_ctrl_x
    message = 'MsgBox You pressed Win+Ctrl+X. The script and DRb server will end now.'
    puts message
    @output_ahk.ahkExec("MsgBox #{message}")
    DRb.thread.exit
  end
end

puts 'Loading AutoHotkey DLL.'
# AutoHotkey.dll should be in a system directory (?) or the same directory as
# the script. In order to use it with WIN32OLE, you must also register it as a
# COM DLL:
# C:\> regsvr32 /s AutoHotkey.dll
# If you don't do that, you can still use WIN32API to access it.
ahk = WIN32OLE.new('AutoHotkey.Script')

puts 'Loading AutoHotkey script.'
ahk_script_name = 'ahk_script.ahk'

# Hotkeys don't seem to get enabled if we load the AHK script this way
# (perhaps the script isn't getting loaded at all? -- I will have to
# experiment):
#ahk.ahkTextDll('')
#ahk.addFile(ahk_script_name)

# This doesn't work either:
#ahk.ahkTextDll('')
#ahk_script_text = ''
#File.open(ahk_script_name, 'r') { |file| ahk_script_text = file.read }
#ahk.addScript(ahk_script_text)

# This loads the script and successfully enables hotkeys:
ahk_script_text = ''
File.open(ahk_script_name, 'r') { |file| ahk_script_text = file.read }
ahk.ahkTextDll(ahk_script_text)

puts 'Starting DRb server.'
uri = 'druby://localhost:8787'
DRb.start_service(uri, MyService.new)
DRb.thread.join

puts 'DRb server thread and AutoHotkey stopped.'
