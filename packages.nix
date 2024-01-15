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
  konsave isoimagewriter  

  # for KDE PLasma
  libsForQt5.qtstyleplugin-kvantum #libsForQt5.qt5ct
  kde-rounded-corners libsForQt5.bismuth
  
        
  # ADDICIONAL SOFTWARE

  # for Konsole
  libsForQt5.yakuake neofetch htop ranger cmatrix inxi duf micro

  # for Browsers
  firefox ungoogled-chromium mullvad-browser  
  libsForQt5.plasma-browser-integration
   
  # for Multimedia
  vokoscreen-ng clipgrab vlc clementine
      
  # for diversos
  thunderbird libsForQt5.pix libsForQt5.ktorrent
  libreoffice-fresh kate meld 

  # needed to run kOrganizer
  libsForQt5.akonadi libsForQt5.korganizer libsForQt5.akonadi-mime
  libsForQt5.kdepim-runtime libsForQt5.akonadi-import-wizard

  # needed for kde-calendar
  # libsForQt5.akonadi-calendar-tools libsForQt5.akonadi-notes
  # libsForQt5.calendarsupport

  # needed for Kaddressbook 
  # libsForQt5.kaddressbook

  # needed for Kmail
  # libsForQt5.kmail libsForQt5.kmailtransport
  # libsForQt5.kmail-account-wizard

  # needed for systeminfo
  fwupd clinfo vulkan-tools glxinfo pciutils
  smartmontools hddtemp xorg.xdpyinfo lm_sensors

  # needed for Security
  gnome.gnome-keyring # gnome.seahorse

  # for WhatsApp
  # whatsapp-for-linux whatsapp-emoji-font  

  ];

}



