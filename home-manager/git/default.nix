{
  pkgs,
  ...
}:
{
  programs = {
    lazygit = {
      enable = true;
      settings = {
        gui = {
          language = "en";
          mouseEvents = true;
          showRandomTip = false;
          showIcons = true;
          showFileIcons = true;
          commitHashLength = 8;
          border = "rounded";
        };
      };
    };
    git = {
      enable = true;
      userName = "zozonteq";
      userEmail = "ottotak@outlook.com";
    };
    gh.enable = true;
  };
  home.packages = with pkgs; [
    gitmoji-cli
    commitizen
  ];
  home.shellAliases = {
    lg = "lazygit";
    gP = "git push";
    gp = "git pull";
    gv = "gh repo view --web";
    gc = "gitmoji -c";
  };
}
