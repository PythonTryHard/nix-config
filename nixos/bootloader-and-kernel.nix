# Bootloader and kernel
{ pkgs, ... }:

{
  # Use the GRUB EFI boot loader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  # Kernel parameters
  boot.kernelParams = [
    "acpi_backlight=native"
  ];

  # Latest kernel to lessen the pain
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Disable NVIDIA for now
  boot.extraModprobeConfig = ''
    blacklist nouveau
    options nouveau modeset=0
  '';
  boot.blacklistedKernelModules = [ "nouveau" ];
}
