{
  lib,
  pkgs,
  config,
  ...
}: {
  options.mystuff = {
    zsh.enable = lib.mkEnableOption "zsh";
    zsh.zinit.enable = lib.mkEnableOption "zsh.zinit";
  };

  config = lib.mkMerge [
    (lib.mkIf config.mystuff.zsh.enable {
      home-manager.users.${config.mystuff.username} = {
        programs.zsh.enable = true;
        home.file.".zshrc".source = ./zshrc;
      };
    })

    (lib.mkIf config.mystuff.zsh.zinit.enable {
      home-manager.users.${config.mystuff.username} = {
        home.packages = [pkgs.zinit];
        home.file.".zshrc".source = ./zinit + ./zshrc;
        home.file.".p10k.zsh".source = ./p10k.zsh;
      };
    })
  ];
}
