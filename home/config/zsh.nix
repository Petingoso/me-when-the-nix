{
  pkgs,
  config',
  ...
}: {
  user.users.${config'.username}.shell = pkgs.zsh;
  home.file.".zshrc".source = ./zsh/zshrc;
  home.file.".p10k.zsh".source = ./zsh/p10k.zsh;
}
