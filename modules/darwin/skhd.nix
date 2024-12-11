let
  terminal = "alacritty";
  A-S-C = "alt + shift + ctrl";
  A-C = "alt + ctrl";
  A-S = "alt + shift";
  A = "alt";
  hyper = "alt + shift + ctrl + cmd";
  display = "yabai -m display";
  window = "yabai -m window";
  space = "yabai -m space";
  config = "yabai -m config";
  grid = {
    full = "--grid 1:1:0:0:1:1";
    halves = {
      left = "--grid 1:2:0:0:1:1";
      right = "--grid 1:2:1:0:1:1";
      top = "--grid 2:1:0:0:1:1";
      bottom = "--grid 2:1:1:0:1:1";
    };
    fourths = {
      first = "--grid 1:4:0:0:1:1";
      second = "--grid 1:4:1:0:1:1";
      third = "--grid 1:4:2:0:1:1";
      fourth = "--grid 1:4:3:0:1:1";
      leftThreeFourths = "--grid 1:4:0:0:3:1";
      rightThreeFourths = "--grid 1:4:1:0:3:1";
    };
    thirds = {
      left = "--grid 1:3:0:0:1:1";
      center = "--grid 1:3:1:0:1:1";
      right = "--grid 1:3:2:0:1:1";
      leftTwoThirds = "--grid 1:3:0:0:2:1";
      rightTwoThirds = "--grid 1:3:1:0:2:1";
    };
  };
  toggle = {
    float = "--toggle float";
    darkMode = "osascript -e 'tell application \"System Events\" to tell appearance preferences to set dark mode to not dark mode'";
  };
  direction = {
      left = "west";
      right = "east";
      up = "north";
      down = "south";
  };
  cmd = {
    swap = {
      action = "--swap";
      left = "${cmd.swap.action} ${direction.left}";
      right = "${cmd.swap.action} ${direction.right}";
      up = "${cmd.swap.action} ${direction.up}";
      down = "${cmd.swap.action} ${direction.down}";
    };
    focus = {
      action = "--focus";
      left = "${cmd.focus.action} ${direction.left}";
      right = "${cmd.focus.action} ${direction.right}";
      up = "${cmd.focus.action} ${direction.up}";
      down = "${cmd.focus.action} ${direction.down}";
    };
  };
in {
  enable = true;
  skhdConfig = ''
    # Launch applications
    cmd - return     : ${terminal}

    # Change focused display
    ${A-C} - 1       : ${display} --focus 1
    ${A-C} - 2       : ${display} --focus 2
    ${A-C} - 3       : ${display} --focus 3

    # Move window to display
    ${A-S-C} - 1     : ${window} --display 1
    ${A-S-C} - 2     : ${window} --display 2
    ${A-S-C} - 3     : ${window} --display 3

    # Change spaces
    ${A} - 1         : ${space} --switch 1
    ${A} - 2         : ${space} --switch 2
    ${A} - 3         : ${space} --switch 3
    ${A} - 4         : ${space} --switch 4
    ${A} - 5         : ${space} --switch 5
    ${A} - 6         : ${space} --switch 6
    ${A} - 7         : ${space} --switch 7
    ${A} - 8         : ${space} --switch 8
    ${A} - 9         : ${space} --switch 9
    ${A} - 0         : ${space} --switch 10

    # Move window to space
    ${A-S} - 1      : ${window} --space 1
    ${A-S} - 2      : ${window} --space 2
    ${A-S} - 3      : ${window} --space 3
    ${A-S} - 4      : ${window} --space 4
    ${A-S} - 5      : ${window} --space 5
    ${A-S} - 6      : ${window} --space 6
    ${A-S} - 7      : ${window} --space 7
    ${A-S} - 8      : ${window} --space 8
    ${A-S} - 9      : ${window} --space 9
    ${A-S} - 0      : ${window} --space 10

    # Focus window
    ${A} - h         : ${window} ${cmd.focus.left}  || $(${display} ${cmd.focus.left})
    ${A} - t         : ${window} ${cmd.focus.down}  || $(${display} ${cmd.focus.down})
    ${A} - j         : ${window} ${cmd.focus.down}  || $(${display} ${cmd.focus.down})
    ${A} - s         : ${window} ${cmd.focus.up}    || $(${display} ${cmd.focus.up})
    ${A} - k         : ${window} ${cmd.focus.up}    || $(${display} ${cmd.focus.up})
    ${A} - n         : ${window} ${cmd.focus.right} || $(${display} ${cmd.focus.right})
    ${A} - l         : ${window} ${cmd.focus.right} || $(${display} ${cmd.focus.right})

    # Swap managed window
    # TODO Make a tool to parse json to get next westmost window (on another display)
    ${A-S} - h      : ${window} ${cmd.swap.left}
    ${A-S} - j      : ${window} ${cmd.swap.down}
    ${A-S} - t      : ${window} ${cmd.swap.down}
    ${A-S} - s      : ${window} ${cmd.swap.up}
    ${A-S} - k      : ${window} ${cmd.swap.up}
    ${A-S} - n      : ${window} ${cmd.swap.right}
    ${A-S} - l      : ${window} ${cmd.swap.right}

    # Move managed window
    ${A-S-C} - h    : ${window} --warp west
    ${A-S-C} - t    : ${window} --warp south
    ${A-S-C} - s    : ${window} --warp north
    ${A-S-C} - n    : ${window} --warp east

    # Move unmanaged window
    ${A-C} - return : ${window} ${toggle.float} ${grid.full}
    ${A-C} - left   : ${window} ${toggle.float} ${grid.halves.left}
    ${A-C} - right  : ${window} ${toggle.float} ${grid.halves.right}
    ${A-C} - up     : ${window} ${toggle.float} ${grid.halves.top}
    ${A-C} - down   : ${window} ${toggle.float} ${grid.halves.bottom}
    ${A-C} - h      : ${window} ${toggle.float} ${grid.fourths.first}
    ${A-C} - t      : ${window} ${toggle.float} ${grid.fourths.second}
    ${A-C} - s      : ${window} ${toggle.float} ${grid.fourths.third}
    ${A-C} - n      : ${window} ${toggle.float} ${grid.fourths.fourth}
    ${A-C} - l      : ${window} ${toggle.float} ${grid.fourths.leftThreeFourths}
    ${A-C} - v      : ${window} ${toggle.float} ${grid.fourths.rightThreeFourths}
    ${A-C} - i      : ${window} ${toggle.float} ${grid.thirds.left}
    ${A-C} - e      : ${window} ${toggle.float} ${grid.thirds.center}
    ${A-C} - a      : ${window} ${toggle.float} ${grid.thirds.right}
    ${A-C} - y      : ${window} ${toggle.float} ${grid.thirds.leftTwoThirds}
    ${A-C} - u      : ${window} ${toggle.float} ${grid.thirds.rightTwoThirds}

    # Increase window size
    ${A-S} - left   : ${window} --resize left:-20:0
    ${A-S} - right  : ${window} --resize right:20:0
    ${A-S} - up     : ${window} --resize top:0:-20
    ${A-S} - down   : ${window} --resize bottom:0:20

    # Decrease window size
    ${A-S-C} - left   : ${window} -- resize left:20:0
    ${A-S-C} - right  : ${window} -- resize right:-20:0
    ${A-S-C} - up     : ${window} -- resize top:0:20
    ${A-S-C} - down   : ${window} -- resize bottom:0:-20

    # Space layout
    ${A} - r        : ${space} --rotate 90
    ${A-S} - r      : ${space} --balance
    ${hyper} - t    : ${window} --toggle split
    ${hyper} - u    : ${config} layout bsp
    ${hyper} - y    : ${config} layout managed
    ${hyper} - o    : ${config} layout float

    # Dark mode toggle
    ${hyper} - z    : ${toggle.darkMode}
  '';
}
