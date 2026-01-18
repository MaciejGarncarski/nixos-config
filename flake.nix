{
  description = "System Config Flake";

  inputs = {
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = 
  { 
    self, 
    nixpkgs,
    nix-flatpak,
    home-manager,
    ...
  }@inputs:
  {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
  
    nixosConfigurations = {
     desktop = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
        username = "maciek";
      };
      modules = [
        home-manager.nixosModules.home-manager
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = specialArgs;
         }
        ./home.nix
        ./configuration.nix
        ./default.nix
        nix-flatpak.nixosModules.nix-flatpak
        { nixpkgs.config.allowUnfree = true; }
      ];
    };
   };
  };
}
