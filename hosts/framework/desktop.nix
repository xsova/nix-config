{ ... }:

{
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        options = "caps:escape";
      };
      autoRepeatDelay = 200;
      autoRepeatInterval = 30;
    };
    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings.main = {
            capslock = "overload(control, esc)";
          };
        };
      };
    };  
    libinput.enable = true;
  };
  console.useXkbConfig = true;
  security.rtkit.enable = true;
}
