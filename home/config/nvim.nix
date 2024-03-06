{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [nil stylua beautysh clang-tools];
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  home.file."./.config/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
