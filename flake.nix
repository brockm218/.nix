{
  description = "BeamOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    fine-cmdline = {
      url = "github:VonHeikemen/fine-cmdline.nvim";
      flake = false;
    };
    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs = {
        nixpkgs-unstable.follows = "nixpkgs";
      };
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      host = "nix-workstation";
      username = "beamic";
    in
    {
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
      	    # inherit system;
            inherit inputs;
            inherit username;
            inherit host;
          };
          modules = [
            ./hosts/${host}/config.nix
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit username;
                inherit inputs;
                inherit host;
              };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.${username} = import ./hosts/${host}/home.nix;
            }
          ];
        };
      };
    };
}
