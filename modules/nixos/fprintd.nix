{pkgs, ...}: {
  enable = true;
  tod.enable = true;
  tod.driver = pkgs.libfprint-2-tod1-goodix-550a;
}
