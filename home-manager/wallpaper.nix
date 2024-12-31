let
  wallpaper_dir = "wallpapers";
in
{
  home.file = {
    "${wallpaper_dir}/cyber.png" = {
      target = "${wallpaper_dir}/cyber.png";
      source = builtins.fetchurl {
        url = "https://i.redd.it/0s49n9i09m9e1.png";
        sha256 = "c17f97608988095705769dcebcd16b615097c2cce026c592dc1473dc39d95e38";
      };
    };
  };
}
