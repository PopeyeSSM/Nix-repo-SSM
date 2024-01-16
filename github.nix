# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{

  programs.git = {
    enable = true;
  	userName = "Sascha Popeye";
  	userEmail = "sspopeyem@gmx.com";
  	# enable large files
  	lfs.enable = true;
  	# enable git-credential-helper with libsecret
  	extraConfig = {
      credential.helper = "${
      	  pkgs.git.override { withLibsecret = true; }
      	}/bin/git-credential-libsecrte";
  	};
  	
  };

}



