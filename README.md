# Playlist Tracker

This VLC extension tracks your current played item in a playlist, writes it to a file in the playlists directory and skips back to it on extension activation.

## Installation

- download `playlist_tracker.lua`
- move it to `C:\Users\[USERNAME]\AppData\Roaming\vlc\lua\extensions` (remember to replace the username)
- restart VLC

## Usage

- play any playlist
- MenuBar or Rightclick -> View -> Playlist Tracker
- if there was already a tracked position it will skip to it, otherwise it will just write the current position
