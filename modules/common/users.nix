{ pkgs, user, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  users.users = {
    ${user} = {
      initialPassword = ""; # FIXME: This needs updated ASAP
      isNormalUser = true;
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [];
      extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" "plugdev" ];
      packages = with pkgs; [
        discord
        etcher
        github-desktop
        file-roller # Archive manager
        opensnitch # Open-source application firewall
        remmina # Open-source remote desktop client
        spotify
      ];
    };
  };
}
