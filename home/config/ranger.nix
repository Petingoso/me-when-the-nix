{pkgs, ...}: {
  home.packages = [pkgs.ranger];
  xdg.configFile = {
    "ranger/commands.py".source = ./ranger/commands.py;
    "ranger/rc.conf".source = ./ranger/rc.conf;
    "ranger/rifle.conf".source = ./ranger/rifle.conf;
    "ranger/plugins/ranger_archives".source = fetchGit {
      url = "https://github.com/maximtrp/ranger-archives";
      rev = "62783ddb84c8fd25eba1be1607d3a47e8efe8b31";
    };
    "ranger/plugins/ranger_devicons".source = fetchGit {
      url = "https://github.com/alexanderjeurissen/ranger_devicons";
      rev = "2c3c19dffb4238d01c74515c9eed5088066db243";
    };
  };
}
