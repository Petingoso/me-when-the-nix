{config, ...}: {
  home-manager.users.${config.mystuff.username} = {
    programs = {
      direnv = {
        enable = true;
        enableZshIntegration = true; # see note on other shells below
        nix-direnv.enable = true;
      };
    };
  };
}
