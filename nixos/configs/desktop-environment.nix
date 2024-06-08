# Desktop environment
{ ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Plasma 6 :D
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.displayManager.defaultSession = "plasma";
  services.displayManager.sddm.wayland.enable = true;
}
