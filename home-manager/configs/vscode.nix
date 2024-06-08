# VSCode
{ ... }:

{
  programs.vscode = {
    enable = true;
    userSettings = {
      "window.titleBarStyle" = "custom";
      "editor.fontFamily" = "PragmataPro Mono Liga";
      "editor.fontSize" = 16;
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 500;
      "editor.codeLensFontFamily" = "PragmataPro Mono Liga";
      "editor.fontLigatures" = true;
      "debug.console.fontFamily" = "PragmataPro Mono Liga";
      "terminal.integrated.fontFamily" = "PragmataProMonoLiga Nerd Font Mono";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "vscode-note.notespath" = "~/.vscode-notes";
    };
  };
}
