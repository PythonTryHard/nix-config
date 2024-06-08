# This file defines overlays
{inputs, ...}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs final.pkgs;

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
  };

  # Sublime Text bypass overlay
  sublime-bypass = final: _prev: {
    sublime = import inputs.nixpkgs {
      system = final.system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "openssl-1.1.1w"
        ];
      };
    };
  };
}