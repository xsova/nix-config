{
  pkgs,
  linux ? false,
  ...
}:

{
  home.sessionVariables = {
    EDITOR = "hx";
    editor = "hx";
    VISUAL = "fleet";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    HOSTNAME = "(hostname -s)";
    IWD = "($PWD)";
    NODE_EXTRA_CA_CERTS = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  } // (if linux then { WINIT_X11_SCALE_FACTOR = 1; } else { });
}
