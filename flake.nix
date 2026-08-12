{
  description = "kflake: flake inspired by Kalium Void";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations = 
    let
      common_modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.backupFileExtension = "bkp";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit self nixpkgs home-manager; };
          home-manager.users.xe = ./home.nix;
        }
      ];
    in
    {
      karm = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = common_modules;
      };
      kx86 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = common_modules;
      };
    };
  };
}
