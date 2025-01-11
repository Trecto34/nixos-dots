{ config, pkgs, ... }:

{
	home.username = "trecto";
	home.homeDirectory = "/home/trecto";

	home.stateVersion = "24.11"; # Please read the comment before changing.

# import programs
		imports = [ ../../programs/tools-pentest.nix ];

# The home.packages option allows you to install Nix packages into your
# environment.
	home.packages = [
		pkgs.neovim
			pkgs.htop
			pkgs.jq
			pkgs.tree
			pkgs.fd
			pkgs.fzf
	];

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
	home.file = {
	};

# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. These will be explicitly sourced when using a
# shell provided by Home Manager. If you don't want to manage your shell
# through Home Manager then you have to manually source 'hm-session-vars.sh'
# located at either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/trecto/etc/profile.d/hm-session-vars.sh
#
	home.sessionVariables = {
		EDITOR = "nvim";
	};

	programs.git = {
		enable = true;
		userName = "Trecto34";
		userEmail = "trecto34@protonmail.com";
	};

# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
