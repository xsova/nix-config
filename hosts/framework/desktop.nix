{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wezterm
    firefox
    vscode
    gimp
    libreoffice
    mullvad-browser
  ];

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
    libinput.enable = true;
  };
  console.useXkbConfig = true;
  services.keyd = {
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
  hardware = {
    # pulseaudio.enable = true;
    bluetooth.enable = true;
  };

  security.rtkit.enable = true;
}
