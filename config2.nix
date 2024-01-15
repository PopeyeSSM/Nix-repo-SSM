# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{

  # Enable Ozone Wayland support in Chromium
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.enableIPv6 = true;


  # The following configuration configures resolved daemon to use the public
  # DNS resolver provided by Cloudflare. DNSSEC and DNS-over-TLS is enabled
  # for authenticity and encryption.
  networking.nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
  
  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    extraConfig = ''
      DNSOverTLS=yes
    '';
  };

  # The global useDHCP flag is deprecated, therefore
  # explicitly set to false here. 
  networking.useDHCP = false;

  # Per-interface useDHCP will be mandatory in the future
  networking.interfaces.enp2s0.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  # Set your time zone.
  time.timeZone = "America/Tegucigalpa";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-128n.psf.gz";
    packages = with pkgs; [ terminus_font ];
  };

  # ZRAM
  zramSwap.enable = true;
  zramSwap.memoryPercent = 25;
 
 
  # List services that you want to enable:
  services.fstrim.enable = true;
    
  # Enable firmware update service
  services.fwupd.enable = true;
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  
  # wayland-related
  security.polkit.enable = true;
  hardware.opengl.enable = true;
  programs.dconf.enable = true;
  # services.xserver.displayManager.defaultSession = "plasmawayland";  


  # Bluetooth service
  hardware.bluetooth.enable = true;
  
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  boot.kernel.sysctl = { "vm.swappiness" = 10;};

  # Automatic Garbage Collection

  # optimise after each and every build
  # nix.settings.auto-optimise-store = true;

  # sets up systemd timer
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "09:00" ];

  # garbage collection
  nix.gc.automatic = true;
  nix.gc.dates = "08:00";
  nix.gc.options = "--delete-older-than 7d";
           
  system.autoUpgrade = {
    enable = true;
    flake = "/etc/nixos#popeye";
    flags = [ "--update-input" "nixpkgs" ];
    allowReboot = false;
    dates = "daily";
    # channel = "https://nixos.org/channels/nixos-23.11";
  };

  # enable gnome-keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;

  # ntfs support
  boot.supportedFilesystems = [ "ntfs" ];

  # install VirtualBox
  # virtualisation.virtualbox.host.enable = true;
  # users.extraGroups.vboxusers.members = [ "popeye" ];
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.guest.x11 = true;

}
