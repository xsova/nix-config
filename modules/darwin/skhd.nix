{pkgs, ...}: {
  enable = true;
  skhdConfig = ''
    # Launch applications
    cmd - return : ${pkgs.alacritty}/bin/alacritty

    # Changed focused display
    # ctrl + alt - 1         : yabai -m display --focus 1
    # ctrl + alt - 2         : yabai -m display --focus 2
    # ctrl + alt - 3         : yabai -m display --focus 3

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
    alt + ctrl - 1        : yabai -m window --space 1
    alt + ctrl - 2        : yabai -m window --space 2
    alt + ctrl - 3        : yabai -m window --space 3
    alt + ctrl - 4        : yabai -m window --space 4
    alt + ctrl - 5        : yabai -m window --space 5
    alt + ctrl - 6        : yabai -m window --space 6
    alt + ctrl - 7        : yabai -m window --space 7
    alt + ctrl - 8        : yabai -m window --space 8
    alt + ctrl - 9        : yabai -m window --space 9
    alt + ctrl - 0        : yabai -m window --space 10

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

    # Rotate Space
    alt - r                : yabai -m space --rotate 90

    # Move floating window
    alt + ctrl - return    : yabai -m window --toggle float --grid 1:1:0:0:1:1 # Full screen
    alt + ctrl - left      : yabai -m window --toggle float --grid 1:2:0:0:1:1 # Left half
    alt + ctrl - right     : yabai -m window --toggle float --grid 1:2:1:0:1:1 # Right half
    alt + ctrl - up        : yabai -m window --toggle float --grid 2:1:0:0:1:1 # Top half
    alt + ctrl - down      : yabai -m window --toggle float --grid 2:1:1:0:1:1 # Bottom half
  '';
}
