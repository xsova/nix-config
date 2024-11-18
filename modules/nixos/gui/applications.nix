{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    firefox
    vscode
    gimp
    libreoffice
    mullvad-browser
  ];
}
