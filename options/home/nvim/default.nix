{
  lib,
  pkgs,
  config,
  ...
}: {
  options.mystuff = {
    nvim-config.enable = lib.mkEnableOption "nvim-config";
  };
  config = lib.mkIf config.mystuff.nvim-config.enable {
    home-manager.users.${config.mystuff.username} = {
      home.packages = with pkgs; [nil stylua beautysh clang-tools prettierd];

      programs.neovim = {
        enable = true;
        extraPackages = [pkgs.gcc pkgs.gdb];
      };

      home.file."./.config/nvim" = {
        source = ./conf;
        recursive = true;
      };
    };
  };
}
