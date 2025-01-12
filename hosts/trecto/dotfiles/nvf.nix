{ config, pkgs, nvf, ... }:

{
  imports = [ nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    # Add your NVF configuration options here
  };
}

