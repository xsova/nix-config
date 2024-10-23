{ pkgs, ... }:

{
  systemd.packages = with pkgs; [
    # auto-cpufreq
  ];

  programs = {
    fish.enable = true;
    dconf.enable = true;
    thunar.enable = true;
  };
  services = {
    dbus = {
      enable = true;
      implementation = "broker";
      packages = with pkgs; [
        gnome2.GConf
      ];
    };
    # upower.enable = true;
    fwupd.enable = true;
    # auto-cpufreq.enable = true;
    tumbler.enable = true;
    # tlp.enable = true;
  };
  environment.systemPackages = with pkgs; [
    at-spi2-atk # Accessibility toolkit
    psi-notify # Desktop notifications
    playerctl # CLI media player controls
    psmisc # Small utilities that use the proc fs (pstree, killall, fuser, peekfd)
    imagemagick # Tools to create, edit, compose, or convert bitmap images.
    ffmpeg_6-full # Audio and video streaming
    xdg-utils # CLI desktop integration tooling
    gifsicle # CLI tool for creating, editing, and optimizing GIFs
  ];
}
