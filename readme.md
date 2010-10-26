ahk_drb_demo
============

Copyright 2010 Eric Christopherson

echristopherson at gmail dot com

Licensed under the GNU GPL, version 2

This is a demo of using AutoHotkey with Ruby and DRb (distributed Ruby). It
consists of one Ruby script (*server.rb*) which acts as a DRb server and loads
an AutoHotkey script; the AutoHotkey script (*ahk_script.ahk*), which defines
four hotkeys; and another short Ruby script (*client.rb*) which is called by the
AutoHotkey script, and invokes methods on the server Ruby script. In this way,
hotkeys cause methods to be called on the server Ruby script.

Installation
------------

Make a folder and put these scripts inside it. Download *AutoHotkey.dll*, if
you don't already have it; it's available at
<http://www.autohotkey.net/~HotKeyIt/AutoHotkey/>. From the *AutoHotkey.dll*
archive, copy *Win32w\AutoHotkey.dll* into the folder these scripts are in.
Finally, register the DLL by opening a command prompt window (press Windows+R
followed by `cmd` and Enter) and `cd`ing to the folder the scripts are in, and
then typing `regsvr32 AutoHotkey.dll`.

Invocation
----------

Open a command prompt window (as described in **Installation**) and `cd` to
the folder the scripts are in. Invoke *server.rb*, e.g. by typing `ruby
server.rb`. I've only tested this with "MRI" Ruby 1.9, but it should work with
other implementations; if you use a Ruby interpreter called something other
than *ruby.exe*, make sure to change the name used in the hotkeys defined in
*ahk_script.ahk* too.

Defined hotkeys
---------------

The included AutoHotkey script, *ahk_script.ahk*, defines three global
hotkeys:

* Windows+Ctrl+A: Display a message box, and a message in the command prompt
  window where the server is running.

* Windows+Ctrl+B: Display a message box, and a message in the command prompt
  window where the server is running.

* Windows+Ctrl+C: Display a message box, and a message in the command prompt
  window where the server is running.

* Windows+Ctrl+X: Display a message box, and a message in the command prompt
  window where the server is running; then exit the AutoHotkey script and Ruby
  server script.

About Ruby
----------

Ruby is a dynamic, object-oriented scripting language created by Yukihiro
MATSUMOTO.

About AutoHotkey
----------------

AutoHotkey (AHK) is a scripting language for Windows which allows you to
define hotkeys which trigger actions in GUI programs, along with
general-purpose scripting. Its home page is <http://www.autohotkey.com>.

About AutoHotkey.dll
--------------------

AutoHotkey.dll is a Windows DLL (dynamic link library) allowing the use of
AutoHotkey functionality from other programming languages (as well as allowing
an AutoHotkey script to embed another AutoHotkey intepreter). It was created
by Naveen Garg (tinku99) and HotkeyIt. It's licensed under the GNU GPL version
2\. For more information on AutoHotkey.dll, see
<http://www.autohotkey.com/forum/topic43049.html> and
<http://www.autohotkey.net/~tinku99/ahkdll/>.
