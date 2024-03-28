{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [nil stylua beautysh clang-tools prettierd];

  programs.neovim = {
    enable = true;
    extraPackages = [pkgs.gcc pkgs.gdb];
  };

  home.file."./.config/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
