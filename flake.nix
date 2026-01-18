{
  description = "System Config Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations.my-pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        { nixpkgs.config.allowUnfree = true; }
      ];
    };
  };
}
