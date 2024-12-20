{
  enable = true;
  skhdConfig = ''
    # Launch applications
    cmd - return : alacritty

    # Changed focused display
    ctrl + alt - 1         : yabai -m display --focus 1
    ctrl + alt - 2         : yabai -m display --focus 2
    ctrl + alt - 3         : yabai -m display --focus 3

    # Move window to display
    ctrl + alt + shift - 1 : yabai -m window --display 1
    ctrl + alt + shift - 2 : yabai -m window --display 2
    ctrl + alt + shift - 3 : yabai -m window --display 3

    ctrl + alt - h         : yabai -m display --focus west
    ctrl + alt - t         : yabai -m display --focus south
    ctrl + alt - j         : yabai -m display --focus south
    ctrl + alt - s         : yabai -m display --focus north
    ctrl + alt - k         : yabai -m display --focus north
    ctrl + alt - n         : yabai -m display --focus east
    ctrl + alt - l         : yabai -m display --focus east

    # Change spaces
    alt - 1                : yabai -m space --switch 1
    alt - 2                : yabai -m space --switch 2
    alt - 3                : yabai -m space --switch 3
    alt - 4                : yabai -m space --switch 4
    alt - 5                : yabai -m space --switch 5
    alt - 6                : yabai -m space --switch 6
    alt - 7                : yabai -m space --switch 7
    alt - 8                : yabai -m space --switch 8
    alt - 9                : yabai -m space --switch 9
    alt - 0                : yabai -m space --switch 10

    # Move window to space
    alt + shift - 1        : yabai -m window --space 1
    alt + shift - 2        : yabai -m window --space 2
    alt + shift - 3        : yabai -m window --space 3
    alt + shift - 4        : yabai -m window --space 4
    alt + shift - 5        : yabai -m window --space 5
    alt + shift - 6        : yabai -m window --space 6
    alt + shift - 7        : yabai -m window --space 7
    alt + shift - 8        : yabai -m window --space 8
    alt + shift - 9        : yabai -m window --space 9
    alt + shift - 0        : yabai -m window --space 10

    # Focus window
    alt - h                : yabai -m window --focus west || $(yabai -m display --focus west)
    alt - t                : yabai -m window --focus south || $(yabai -m display --focus south)
    alt - j                : yabai -m window --focus south || $(yabai -m display --focus south)
    alt - s                : yabai -m window --focus north || $(yabai -m display --focus north)
    alt - k                : yabai -m window --focus north || $(yabai -m display --focus north)
    alt - n                : yabai -m window --focus east || $(yabai -m display --focus east)
    alt - l                : yabai -m window --focus east || $(yabai -m display --focus east)

    # Swap window
    alt + shift - h        : yabai -m window --swap west  || $(yabai -m window --display west; yabai -m window --focus last)
    alt + shift - t        : yabai -m window --swap south || $(yabai -m window --display south; yabai -m window --focus last)
    alt + shift - j        : yabai -m window --swap south || $(yabai -m window --display south; yabai -m window --focus last)
    alt + shift - s        : yabai -m window --swap north || $(yabai -m window --display north; yabai -m window --focus last)
    alt + shift - k        : yabai -m window --swap north || $(yabai -m window --display north; yabai -m window --focus last)
    alt + shift - n        : yabai -m window --swap east  || $(yabai -m window --display east; yabai -m window --focus last)
    alt + shift - l        : yabai -m window --swap east  || $(yabai -m window --display east; yabai -m window --focus last)
  '';
}

# Increase window size
# cmd + ctrl + alt + shift - h : yabai -m window --resize left:-20:0
# cmd + ctrl + alt + shift - t : yabai -m window --resize bottom:0:20
# cmd + ctrl + alt + shift - j : yabai -m window --resize bottom:0:20
# cmd + ctrl + alt + shift - s : yabai -m window --resize top:0:-20
# cmd + ctrl + alt + shift - k : yabai -m window --resize top:0:-20
# cmd + ctrl + alt + shift - n : yabai -m window --resize right:20:0
# cmd + ctrl + alt + shift - l : yabai -m window --resize right:20:0
# Decrease window size
# cmd + alt + shift - h : yabai -m window --resize left:20:0
# cmd + alt + shift - t : yabai -m window --resize bottom:0:-20
# cmd + alt + shift - j : yabai -m window --resize bottom:0:-20
# cmd + alt + shift - s : yabai -m window --resize top:0:20
# cmd + alt + shift - k : yabai -m window --resize top:0:20
# cmd + alt + shift - n : yabai -m window --resize right:-20:0
# cmd + alt + shift - l : yabai -m window --resize right:-20:0

