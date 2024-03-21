{config, ...}: {
  nix.settings = {
    experimental-features = [
      "flakes"
      "nix-command"
    ];
    trusted-users = [
      "root"
      config.myOptions.other.system.username
    ];
    auto-optimise-store = true;
    # keep-outputs = true;
    # keep-derivations = true;
  };
}
