{config', ...}: {
  nix.settings = {
    experimental-features = [
      "flakes"
      "nix-command"
    ];
    trusted-users = [
      "root"
      config'.username
    ];
    auto-optimise-store = true;
    # keep-outputs = true;
    # keep-derivations = true;
  };
}
