let
  wallpaper_dir = "wallpapers";
in
{
  home.file = {
    "${wallpaper_dir}/minecraft-village.png" = {
      target = "${wallpaper_dir}/minecraft-village.png";
      source = builtins.fetchurl {
        url = "https://i.redd.it/gllpjsuq3wc61.png";
        sha256 = "b4a9ac5fa8c11e82509e57a2fafce568c031fcf0fb49a9061a177e43d1f950f5";
      };
    };
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
    "${wallpaper_dir}/lain1.png" = {
      target = "${wallpaper_dir}/lain1.png";
      source = builtins.fetchurl {
        url = "https://images3.alphacoders.com/848/848404.jpg";
        sha256 = "cfcda91c5543fa0944f9706a801d1401cd59492e5998c08ce5ae7e95a2d47762";
      };
    };
    "${wallpaper_dir}/lain2.png" = {
      target = "${wallpaper_dir}/lain2.png";
      source = builtins.fetchurl {
        url = "https://images8.alphacoders.com/959/thumb-1920-959316.png";
        sha256 = "9dfd61b64cbbe0573abe72175f415b1487b549233e730995a60bcb0cf0d05cf1";
      };
    };
  };
}
