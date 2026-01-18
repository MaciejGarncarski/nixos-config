{ username, ... }:
{

  home-manager = {
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