_: {
  environment.systemPackages = with pkgs; [opentabletdriver];

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };
}
