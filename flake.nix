{
  description = "kflake: flake inspired by Kalium Void";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, stylix }: {
    wp-path = "${self}/wp/wp1.jpg";
    nixosConfigurations = 
    let
      common_modules = [
        ./configuration.nix
        stylix.nixosModules.stylix {
          stylix = { 
            enable = true;
            #image = builtins.toPath self.wp-path;
            base16Scheme = {
              author = "Stylix";
              base00 = "081d2e";
              base01 = "004b72";
              base02 = "366da6";
              base03 = "72a3cc";
              base04 = "a1bbdc";
              base05 = "dae4ee";
              base06 = "eaf2f4";
              base07 = "eaf2f5";
              base08 = "5c95cc";
              base09 = "6896b7";
              base0A = "7193c1";
              base0B = "5797c5";
              base0C = "7f93ac";
              base0D = "6c97aa";
              base0E = "6895be";
              base0F = "7395ae";
              scheme = "Stylix";
              slug = "stylix";
            };
            polarity = "dark";
          };
        }
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
