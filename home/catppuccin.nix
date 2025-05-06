let
  common = {
    enable = true;
    flavor = "latte";
  };
in
{
  enable = true;
  helix = common // {
    useItalics = true;
  };
  fish = common;
  alacritty = common;
  bat = common;
  fzf = common // {
    accent = "mauve";
  };
  ghostty = common;
  lazygit = common;
  lsd = common;
  yazi = common // {
    accent = "mauve";
  };
  zellij = common;
}
