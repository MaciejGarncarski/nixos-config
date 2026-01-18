{ username, ... }:
{
  home-manager = {
    backupFileExtension = "bkup";
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${username} =
      {
        inputs,
        pkgs,
        config,
        lib,
        ...
      }:
      {
        home.stateVersion = "25.11";
        
        # Coding
        home.packages = with pkgs; [
          vscode
          bun
          mise
        ];
        
        programs.eza = {
          enable = true;
          enableZshIntegration = true;
          enableBashIntegration = true;
          extraOptions = [
            "--icons"
            "--git"
          ];
        };

        programs.bat = {
          enable = true;
          config = {
            pager = "less -FR";
          };
          extraPackages = with pkgs.bat-extras; [
            batman
            batpipe
            # batgrep
          ];
        };

        # Git Configuration
        programs.git = {
          enable = true;

          settings = {
            user = {
              name = "Maciej Garncarski";
              email = "maciejgarncarski@protonmail.com";
            };
          };
        };
      };
  };

}