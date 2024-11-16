{
  pkgs,
  inputs,
  ...
}: {
  environment = {
    systemPackages = [pkgs.m-cli pkgs.pinentry_mac pkgs.cava];
    etc."nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
    extraInit = let
      homeManagerSessionVars = "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh";
    in ''[[ -f ${homeManagerSessionVars} ]] && source ${homeManagerSessionVars} '';
  };
}
