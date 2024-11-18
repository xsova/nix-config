{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    avizo 
    cliphist 
    dunst 
    egl-wayland
    grim 
    poweralertd 
    qt6.qtwayland 
    rofi-wayland 
    slurp 
    waybar 
    wayland
    wayland-protocols
    wayland-scanner
    wayland-utils
    wl-clipboard 
    wl-clip-persist 
    wlogout 
    wlrctl 
    wlr-randr
    wl-screenrec 
    wtype 
    xwayland
  ];
}
