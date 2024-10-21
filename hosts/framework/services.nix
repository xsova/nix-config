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
    upower.enable = true;
    fwupd.enable = true;
    # auto-cpufreq.enable = true;
    tumbler.enable = true;
    # tlp.enable = true;
  };
  environment.systemPackages = with pkgs; [
    at-spi2-atk # Accessibility toolkit
    qt6.qtwayland # Qt application wayland integration
    psi-notify # Desktop notifications
    poweralertd # Daemon that monitors power supply events
    playerctl # CLI media player controls
    psmisc # Small utilities that use the proc fs (pstree, killall, fuser, peekfd)
    grim # A screenshot utility for wayland
    slurp # A tool to select a region in a wayland compositor
    imagemagick # Tools to create, edit, compose, or convert bitmap images.
    ffmpeg_6-full # Audio and video streaming
    wl-screenrec # Screen recording tool for wayland
    wl-clipboard # Clipboard for wayland
    wl-clip-persist # Clipboard manager that persists clipboard contents
    cliphist # Clipboard history manager
    xdg-utils # CLI desktop integration tooling
    wtype # CLI tool to send fake input events into wayland compositor
    wlrctl # A tool to control aspects of wayland compositors that use wlroots lib
    waybar # Customizable bar for wayland
    rofi-wayland # A window switcher, application launcher, and dmenu replacement
    dunst # Notification daemon
    avizo # Tool to display system information in a wayland environment
    wlogout # Logout menu for wayland
    gifsicle # CLI tool for creating, editing, and optimizing GIFs
  ];
}
