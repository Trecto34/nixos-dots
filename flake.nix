{
	description = "Nixos config flake";

	inputs = {
# Unstable Channel
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

# Home Manager
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs: 
		let
		system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system};
	in {
		nixosConfigurations.trecto = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = { inherit inputs; };
			modules = [
				./hosts/trecto/configuration.nix
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.trecto = import ./hosts/trecto/home.nix;
					}
			];
		};
	};
}
