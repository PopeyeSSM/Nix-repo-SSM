{ config, pkgs, lib, ... }:

{

  # Enable the X11 windowing system
    services.xserver.enable = true;

  # Enable if Intel GPU will be loaded
    services.xserver.videoDrivers = [ "modesetting" ];

  # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  environment.variables = {
    VDPAU_DRIVER =
      lib.mkIf config.hardware.opengl.enable (lib.mkDefault "va_gl");

  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;        # Video Support for Steam
    extraPackages = with pkgs; [
      intel-media-driver           # LIBVA_DRIVER_NAME=iHD
      vaapiIntel                   # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau                   # Intel Drivers
      libvdpau-va-gl               # Intel Drivers
      beignet                      # for Intel CPU Gen7
      
    ];
  };

  environment.systemPackages = with pkgs; [
    vaapiIntel
    vaapi-intel-hybrid
    libva
    libva-utils
    intel-media-driver
    vaapiVdpau
    libvdpau-va-gl
    beignet
  ];

  # steam-hardware.enable = true;

}

