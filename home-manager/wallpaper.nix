let
  wallpaper_dir = "wallpapers";
in
{
  home.file = {
    "${wallpaper_dir}/lucy.png" = {
      target = "${wallpaper_dir}/lucy.png";
      source = builtins.fetchurl {
        url = "https://i.redd.it/nkidvnuxxqla1.png";
        sha256 = "5e0720213990dbc5d8c10ff891208d1b18c4cd1d20c246651c7b7508f6859773";
      };
    };
    "${wallpaper_dir}/sunset-vienna.png" = {
      target = "${wallpaper_dir}/sunset-vienna.png";
      source = builtins.fetchurl {
        url = "https://i.redd.it/e25lwtkf179e1.jpeg";
        sha256 = "e53c7ebad53e18867d6bea959f43213fd903ec4d2b6d8c87edc762b817c5f81f";
      };
    };
    "${wallpaper_dir}/cyber.png" = {
      target = "${wallpaper_dir}/cyber.png";
      source = builtins.fetchurl {
        url = "https://i.redd.it/0s49n9i09m9e1.png";
        sha256 = "c17f97608988095705769dcebcd16b615097c2cce026c592dc1473dc39d95e38";
      };
    };
  };
}
