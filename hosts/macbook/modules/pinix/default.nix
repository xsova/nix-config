{ pkgs, inputs, ... }: 
{
  environment.systemPackages = [(inputs.pinix.packages.${pkgs.stdenv.hostPlatform.system}.pinix)];
}

