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
      programs.zsh.enable = true;
      users.users.${config.mystuff.username}.shell = pkgs.zsh;
      home-manager.users.${config.mystuff.username} = {
        home.packages = [pkgs.eza pkgs.fzf];
        programs.zsh.enable = true;
        home.file.".zshrc".text =
          lib.mkDefault "${builtins.readFile ./zshrc}";
      };
    })

    (lib.mkIf config.mystuff.zsh.zinit.enable {
      home-manager.users.${config.mystuff.username} = {
        home.packages = [pkgs.zinit];
        home.file.".zshrc".text = lib.mkForce (
          lib.strings.concatStrings [
            "${builtins.readFile ./zinit}"
            "${builtins.readFile ./zshrc}"
          ]
        );
        home.file.".p10k.zsh".source = ./p10k.zsh;
      };
    })
  ];
}
