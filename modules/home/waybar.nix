{
  enable = true;
  settings = {
    topBar = {
      layer = "top";
      position = "top";
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [
        "temperature"
        "network"
        "battery"
      ];
      battery = {
        states = {
          good = 90;
          warning = 50;
          critical = 25;
        };
        format = "battery: {capacity}%";
        format-alt = "{time}";
      };
      network = {
        format = "{ifname}";
        format-wifi = "{essid} ({signalStrength}%)";
        format-ethernet = "{ipaddr}/{cidr}";
        on-click = "kitty --class floatingKitty --detach impala";
      };
      "wlr/workspaces" = {
        format = "{name}";
        on-click = "activate";
      };
      clock = {
        format = "{:%F  %H:%M}";
        tooltip = false;
        timezone = "America/Nebraska/Omaha";
      };
      temperature = {
        hwmon-path-abs = "/sys/devices/pci0000:00/00000:00:18.3/hwmon";
        input-filename = "temp1_input";
        format = "{temperatureC}.C";
        format-alt = "{temperatureF}.F";
      };
    };
  };
  style = ''
    * {
      font-size: 16px;
      font-family: MD IO Trial;
      font-weight: bold;
      border-radius: 2px;
      border: none;
      margin: 0px;
      padding: 0px;
    }
  '';
  #   .modules-left,
  #   .modules-center,
  #   .modules-right {
  #     border-bottom: 2px solid 0xff11111b;
  #   }
  # '';
}
