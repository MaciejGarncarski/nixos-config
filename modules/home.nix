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

        programs.ghostty = {
          enable = true;
          # Only install the package on Linux; on macOS it's installed via Homebrew
          package = if pkgs.stdenv.isLinux then pkgs.ghostty else null;
          enableZshIntegration = true;
          settings = {
            theme = "Catppuccin Frappe";
            font-family = "Monaspace Argon";
            font-size = 10;
            background-opacity = 0.87;
            background-blur = 20;
            unfocused-split-opacity = 0.9;
          };
        };

        programs.bat = {
          enable = true;
          config = {
            pager = "less -FR";
          };
          extraPackages = with pkgs.bat-extras; [
            batman
            batpipe
            batgrep
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
