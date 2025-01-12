{
	description = "Nixos config flake";

	inputs = {
# Unstable Channel
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

# NVF
		nvf = {
			url = "github:NotAShelf/nvf";
			inputs.nixpkgs.follows = "nixpkgs";
		};

# Home Manager
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, nvf, ... }@inputs: 
		let
		system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system};
	in {
		nixosConfigurations.trecto = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = { inherit inputs nvf; };
			modules = [
				./hosts/trecto/configuration.nix
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.trecto = import ./hosts/trecto/home.nix;
						home-manager.extraSpecialArgs = { inherit nvf; };
					}
			];
		};
	};
}
