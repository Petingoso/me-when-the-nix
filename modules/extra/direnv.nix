{config, lib, ...}: {
  home-manager.users.${config.mystuff.username} = {
    programs = {
      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
    };
  };
}

lib.mkIf config.mystuff.zsh.enable {
home-manager.users.${config.mystuff.username}.programs.direnv.enableZshIntegration = true; # see note on other shells below

}
