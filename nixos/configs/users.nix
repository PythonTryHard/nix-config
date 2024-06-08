 # User accounts
{ pkgs, ... }:

{
  users.users = {
    f4ll3n53r4ph = {
      home = "/home/f4ll3n53r4ph";
      description = "F4ll3n53r4ph";
      hashedPassword = "$y$j9T$8clt9YQiy9j2du5qip.UM/$Q1vUaNAwf8KIToKvimC/3KfNFLd0iM/WSMV1TLccoF/";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [  ];

      extraGroups = ["wheel" "networkmanager"];
      packages = with pkgs; [
        firefox
        tree
      ];
    };
  };
}
