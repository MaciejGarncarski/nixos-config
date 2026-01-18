{
  description = "System Config Flake";

  inputs = {
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = 
  { 
    self, 
    nixpkgs,
    nix-flatpak,
    ...
  }@inputs:
  {
    nixosConfigurations.my-pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "maciek";
      };
      
      modules = [
        ./configuration.nix
        ./default.nix
        nix-flatpak.nixosModules.nix-flatpak
        { nixpkgs.config.allowUnfree = true; }
      ];
    };
  };
}
