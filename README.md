# Reason12-Akai-MIDImix-remote-map-codec
Reason 12 Akai MIDImix controller remote map and codec to get it working fully with the Reason 12 mixer

Includes soft pickup for the sliders (And knobs if you want to enable those). This way the analog controls only act when the value on the slider matches the value of the control it is assigned so it stops the slider "jumping" when you slide it.

# Installation

Copy the Remote Files

The files should be copied into your Remote directory:

OSX: Macintosh HD/Library/Application Support/Propellerhead Software/Remote
it is also possible to install into /Users/[username]/Library/Application Support/Propellerhead Software/Remote if you want to keep them separate from your main Reason installation.
Windows XP: C:/Documents and Settings/Application Data/Propellerhead Software/Remote/
Windows Vista: C:/Documents and Settings/Program Data/Propellerhead Software/Remote/
Windows 7: C:/ProgramData/Propellerhead Software/Remote

Carefully copy all of these files, strictly maintaining this directory structure:

Remote/Codecs/Lua Codecs/Akai/AkaiMidiMix.luacodec
Remote/Codecs/Lua Codecs/Akai/AkaiMidiMix.lua
Remote/Codecs/Lua Codecs/Akai/AkaiMidiMix.png
Remote/Maps/Akai/AkaiMidiMix.remotemap

Now restart Reason so that it sees the new files. Go into Preferences and select your new MIDI controller - you can tell Reason to try and auto-detect the controller, or you can add it manually. Also make sure you click on the master section and lock it to the Akai MIDImix.

Note: I am not affiliated or associated in any way with Akai or Propellerhead. I have created these files myself for my own use.

WARNING: You download and use these files entirely at your own risk!

I release this under a Creative Commons Attribution 3.0. http://creativecommons.org/licenses/by/3.0/
