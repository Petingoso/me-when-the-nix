{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [nil stylua beautysh clang-tools];

  programs.neovim = {
    defaultEditor = true;
    enable = true;
    extraPackages = [pkgs.gcc];
  };

  home.file."./.config/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
