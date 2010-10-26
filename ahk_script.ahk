; ahk_script.ahk
; Created Oct. 25, 2010
; Part of ahk_drb_test - a demonstration of how to call AHK code from Ruby,
; and Ruby code from AHK, using DRb.
; Licensed under the GNU GPL v2.

#SingleInstance Force

#^a::Run rubyw client.rb win_ctrl_a
#^b::Run rubyw client.rb win_ctrl_b
#^c::Run rubyw client.rb win_ctrl_c
#^x::Run rubyw client.rb win_ctrl_x
