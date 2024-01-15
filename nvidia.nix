{ config, lib, pkgs, ... }:

{

  # Make sure opengl is enabled
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;   # for Steam Games
    };

  # Enable the X11 windowing system.
    services.xserver.enable = true;

  # Allow unfree packages, also needed by Nvidia
    nixpkgs.config.allowUnfree = true;

  # Activate and enable Nvidia
    services.xserver.videoDrivers = ["nvidia"];
  
  # Laptop Optimus System with:
    # Nvidia Prime: offload- and sync-mode
    hardware.nvidia.prime = {
      offload.enable = true; # activates Intel GPU
      # sync.enable = true; # activates Nvidia GPU
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };

   # HARDWARE Nvidia

   # Modesetting is needed for most Wayland compositors
     hardware.nvidia.modesetting.enable = true;
    
   # Prevent or fix screen tearing on Nvidia
     hardware.nvidia.forceFullCompositionPipeline = true;
  
   # Nvidia power management
     hardware.nvidia.powerManagement.enable = lib.mkDefault true;
    
   # Adjusting Dpi scale from 75 to 96 on Nvidia
     services.xserver.dpi = 96;

   # Enable the nvidia settings menu
     hardware.nvidia.nvidiaSettings = true;

   # Optionally, you may need to select the appropriate driver version for your specific GPU.
     hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;  

   
}
