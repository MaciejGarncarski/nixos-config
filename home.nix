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
        
        # Additional Packages
        home.packages = with pkgs; [
          vscode
          bun
          discord
          mise
          lazygit
          ripgrep
          lazydocker
          fd
          tree
          tldr
          diff-so-fancy
          nixfmt
          nh
          nix-output-monitor
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