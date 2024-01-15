# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [

  # Systemtools 
  wget gnugrep gnumake git util-linux wireguard-tools
  cmake efibootmgr gparted bluez bluez-tools httpie
  libinput ntfs3g dhcpcd mesa zram-generator gzip outils


  # ADDICIONAL SOFTWARE

  # for Konsole
  neofetch htop ranger cmatrix inxi duf micro

  # for Browsers
  ungoogled-chromium mullvad-browser
  libsForQt5.qt5ct #libsForQt5.

  # for Multimedia
  clipgrab vlc
      
  # for diversos
  thunderbird libsForQt5.pix
  libreoffice-fresh
                  
  # needed to run kOrganizer
  libsForQt5.akonadi libsForQt5.korganizer libsForQt5.akonadi-mime
  libsForQt5.kdepim-runtime libsForQt5.akonadi-import-wizard
  # libsForQt5.akonadi-calendar-tools libsForQt5.akonadi-notes
      
  # needed for systeminfo
  fwupd clinfo vulkan-tools glxinfo pciutils
  smartmontools hddtemp xorg.xdpyinfo lm_sensors

  # needed for Security
  gnome.gnome-keyring gnome.seahorse

  # for WhatsApp
  # whatsapp-for-linux whatsapp-emoji-font     

  ];

}



