{ ... }:

{
  services.skhd = {
    skhdConfig = ''
      # CONFIGURATION FOR SKHD -- Keybindings for yabai wm and other stuff.
      
      # LIMITS:
      # cmd (only) | alt (only) + arrows is off-limits, because of text navigation being eaten.
      # alt + return is off limits because of intellij based ide muscle memory.
      # cmd + shift - l is off limits for linter in intellij
      
      # ASSUMPTIONS:
      # Everything here is based on this layout- you can reasonably assume that the layout would be easy-ish to translate to qwerty
      # https://configure.zsa.io/moonlander/layouts/yGzoP/latest/0
      
      # LAYOUT:
      # #$ bB yY oO uU  '(  ")  lL dD wW vV zZ
      # @` cC iI eE aA  ,;  .:  hH tT sS nN qQ
      # /\ gG xX jJ kK  -_  ?!  rR mM fF pP
      
      # I use homerow mods on a split keyboard with 3x6 + 3 thumbkeys, so c=ctrl, i=alt, e=shift, a=super -- n=ctrl, s=alt, t=shift, h=super
      # pinky -> index, ctrl - alt - shift - super (for each hand)
      # I don't have a number row on my base layer, and use thumb keys to access arrows, symbols, numbers, f-keys, etc. All keys are distange <= 1 from homerow
      # hyper = cmd + ctrl + shift + opt(alt)
      
      # Open terminal
      cmd - return               : alacritty
      cmd + shift - return       : open -a "Arc"
      cmd + shift + alt - return : open -a "Aqua"
      hyper - return             : open -a "Terminal"
      
      #  Focus window
      alt - h                    : yabai -m window --focus west
      alt - t                    : yabai -m window --focus south
      alt - s                    : yabai -m window --focus north
      alt - n                    : yabai -m window --focus east
      
      #  Swap managed window
      shift + alt - h            : yabai -m window --swap west
      shift + alt - t            : yabai -m window --swap south
      shift + alt - s            : yabai -m window --swap north
      shift + alt - n            : yabai -m window --swap east
      
      #  Move managed window
      shift + alt + ctrl - h     : yabai -m window --warp west
      shift + alt + ctrl - t     : yabai -m window --warp south
      shift + alt + ctrl - s     : yabai -m window --warp north
      shift + alt + ctrl - n     : yabai -m window --warp east
      
      # Grid works like this:    `1:4` = divide the screen into one row and four columns
      #                          `3:0` = starts at x = 3, y = 0 (in a zero based array of positions based on previous two numbers)
      #                          `1:1` = spans 1 column horizontally and vertically.
      
      # Toggle floating, fill    screen
      ctrl  + alt - return       : yabai -m window --toggle float --grid 1:1:0:0:1:1 # Full screen
      ctrl  + alt - left         : yabai -m window --toggle float --grid 1:2:0:0:1:1 # Left half
      ctrl  + alt - right        : yabai -m window --toggle float --grid 1:2:1:0:1:1 # Right half
      ctrl  + alt - up           : yabai -m window --toggle float --grid 2:1:0:0:1:1 # Top half
      ctrl  + alt - down         : yabai -m window --toggle float --grid 2:1:1:0:1:1 # Bottom half
      
      #  Fourths
      ctrl  + alt - h            : yabai -m window --toggle float --grid 1:4:0:0:1:1 # First fourth
      ctrl  + alt - t            : yabai -m window --toggle float --grid 1:4:1:0:1:1 # Second fourth
      ctrl  + alt - s            : yabai -m window --toggle float --grid 1:4:2:0:1:1 # Third fourth
      ctrl  + alt - n            : yabai -m window --toggle float --grid 1:4:3:0:1:1 # Fourth fourth
      ctrl  + alt - l            : yabai -m window --toggle float --grid 1:4:0:0:3:1 # First through third fourths
      ctrl  + alt - v            : yabai -m window --toggle float --grid 1:4:1:0:3:1 # Second through last fourths
      
      #  Thirds
      ctrl  + alt - i            : yabai -m window --toggle float --grid 1:3:0:0:1:1 # Left third
      ctrl  + alt - e            : yabai -m window --toggle float --grid 1:3:1:0:1:1 # Middle third
      ctrl  + alt - a            : yabai -m window --toggle float --grid 1:3:2:0:1:1 # Right third
      ctrl  + alt - y            : yabai -m window --toggle float --grid 1:3:0:0:2:1 # Left 2/3
      ctrl  + alt - u            : yabai -m window --toggle float --grid 1:3:1:0:2:1 # Right 2/3
      
      # Insertion point based    on focused container
      ctrl  + alt + shift - l    : yabai -m window --insert west
      ctrl  + alt + shift - d    : yabai -m window --insert south
      ctrl  + alt + shift - w    : yabai -m window --insert north
      ctrl  + alt + shift - v    : yabai -m window --insert east
      
      #  Resize windowm
      ctrl  - sound_up           : yabai -m window --resize left:-20:0 # Make the left side bigger by 20px
      ctrl  - sound_down         : yabai -m window --resize left:20:0 # Make the left side smaller by 20px
      cmd   - sound_up           : yabai -m window --resize right:20:0 # Make the right side bigger by 20px
      cmd   - sound_down         : yabai -m window --resize right:-20:0 # Make the right side smaller by 20px
      
      #  Move displays
      ctrl + alt  - next          : yabai -m window --display next; yabai -m window --focus recent
      ctrl + alt  - previous      : yabai -m window --display prev; yabai -m window --focus recent
      
      #  Focus other displays
      ctrl - next                 : yabai -m display --focus next
      ctrl - previous             : yabai -m display --focus prev
      
      #  Change space(s)
      hyper - b                  : yabai -m space --focus 1
      hyper - v                  : yabai -m space --focus 2
      hyper - p                  : yabai -m window --space next
      hyper - g                  : yabai -m window --space prev
      
      # Rotate tree
      alt - r                    : yabai -m space --rotate 90
      
      #  Balance windows
      shift + alt - a            : yabai -m space --balance
      
      # Restart skhd
      cmd + shift + alt - r      : skhd --restart-service
      
      #  Stop/Start/Restart ya   bai
      hyper - r                  : yabai --restart-service
      hyper - k                  : yabai --stop-service
      hyper - s                  : yabai --start-service
      
      #  Toggle window split t   ype
      hyper - t                  : yabai -m window --toggle split
      hyper - u                  : yabai -m config layout bsp
      hyper - y                  : yabai -m config layout managed
      hyper - o                  : yabai -m config layout float
      
      #  Toggle dark mode & li   ght mode
      hyper - z                  : osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to not dark mode'
    '';
  };
}
