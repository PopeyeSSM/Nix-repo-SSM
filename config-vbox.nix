					# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{

  # Enable Virtualbox

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "popeye" ];

  # Enable Oracle Extensions (usb2 or usb3)
  virtualisation.virtualbox.host.enableExtensionPack = true;

  # Enable VirtualBox Guest Additions
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.x11 = true;

}
