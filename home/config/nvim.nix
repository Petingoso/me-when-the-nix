{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [nil stylua beautysh clang-tools];

  programs.neovim = {
    enable = true;
    extraPackages = [pkgs.gcc];
  };

  home.file."./.config/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
