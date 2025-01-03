{ ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {      
        enable_wayland = true,
        font = wezterm.font('JetBrains Mono'),
        window_padding = {
          left = 15,
          right = 15,
          top = 15,
          bottom = 15,
        },
        window_background_opacity = 0.8,
        text_background_opacity = 0.7,
        window_decorations = "RESIZE",
        enable_tab_bar = false,
        color_scheme = "Catppuccin Macchiato",
        macos_window_background_blur = 19,
      }
    '';
  };
}
