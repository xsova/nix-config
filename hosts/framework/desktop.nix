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
      xkb.layout = "us";
    };
    libinput.enable = true;
  };
  hardware = {
    # pulseaudio.enable = true;
    bluetooth.enable = true;
  };

  security.rtkit.enable = true;
}
