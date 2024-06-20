# Local user's packages
{ pkgs, ... }:

{
  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    # Day-to-day usage
    jetbrains-toolbox
    discord-ptb
    vlc
    ffmpeg_7-full
    _7zz
    telegram-desktop
    libreoffice-qt

    # Tools
    lshw
    file
    
    # CLI QoL
    eza
    btop
    ripgrep
    bat
    fd
    jq
    curlie

    # Java
    jdk

    # Runtimes
    asdf-vm
    pipx

    # Development
    nil
    delta
    difftastic

    # Theming
    kdePackages.qtstyleplugin-kvantum
  ];
}
