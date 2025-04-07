{
  lib,
  pkgs,
  ...
}:
{
  yabai.serviceConfig.EnvironmentVariables.SHELL = lib.getExe pkgs.zsh;
  skhd.serviceConfig.EnvironmentVariables.SHELL = lib.getExe pkgs.dash;
  spacebar.serviceConfig.EnvironmentVariables.SHELL = lib.getExe pkgs.dash;
}
