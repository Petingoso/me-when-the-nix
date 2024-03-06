{
  config',
  inputs,
  ...
}: {
  home-manager.users.${config'.username}.imports = [
    inputs.hypridle.homeManagerModules.default
    inputs.hyprlock.homeManagerModules.default
  ];
}
