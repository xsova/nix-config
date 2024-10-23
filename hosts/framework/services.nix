{ ... }:

{
  services = {
    dbus = {
      enable = true;
      implementation = "broker";
    };
    fwupd.enable = true;
    tumbler.enable = true;
    ollama.enable = true;
  };
}
