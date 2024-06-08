{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    kdePackages.kate
    micro
    wget
    home-manager
    aria2
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Friendship's ended with ZSH
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Git
  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  # Firefox 
  programs.firefox = {
    package = pkgs.firefox-bin;
    
    nativeMessagingHosts.packages = [
      pkgs.kdePackages.plasma-browser-integration
    ];
    preferences = {
      "widget.use-xdg-desktop-portal.file-picker" = 1;
    };
  };

  # Nix helper
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/f4ll3n53r4ph/.nix-config";
  };
}
