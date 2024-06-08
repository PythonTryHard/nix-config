{ pkgs, ... }:

{
  imports = [
    ./starship-preset.nix
  ];

  programs.fastfetch = {
    enable = true;
  };

  programs.fish = {
    enable = true;
    plugins = [ ];

    shellInit = "set fish_greeting";
    shellInitLast = "${pkgs.starship}/bin/starship init fish | source";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = false;
    settings = {
      # Prompt
      add_newline = true;
      continuation_prompt = "▶ ";

      /* The prompt format, mimicking that of Powerlevel10k.
       *
       * Due to being a two-line prompt, we will have to use
       * $fill and $linebreak to align everything.
       */
      format = "[╭─$os$shell$directory$git_branch$git_commit$git_status$git_state$fill( $singularity$pijul_channel$docker_context$package$c$cmake$cobol$daml$dart$deno$dotnet$elixir$elm$erlang$fennel$gleam$golang$guix_shell$haskell$haxe$helm$java$julia$kotlin$gradle$lua$nim$nodejs$ocaml$opa$perl$php$pulumi$purescript$python$quarto$raku$rlang$red$ruby$rust$scala$solidity$swift$terraform$typst$vlang$vagrant$zig$buf$nix_shell$conda$meson$spack$aws$gcloud$openstack$azure$nats$direnv$crystal$container)$fill$status$jobs$cmd_duration$username\[@](white)$hostname$time$line_break╰─](bright-green)$character";


      # Modules
      ## Left aligned modules
      os = {
        format = "\\[$symbol\\] ";
        
        disabled = false;
      };
      
      shell = {
        format = "\\[$indicator\\] ";

        disabled = false;
        unknown_indicator = "?sh";
      };

      directory = {
        format = "[$read_only]($read_only_style)[$path]($style) ";
        style = "cyan";
        repo_root_format = "[$read_only]($read_only_style)[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path]($style) ";
        repo_root_style = "bold cyan";

        
        truncation_symbol = "";
        truncate_to_repo = false;

        substitutions = {};
      };

      git_branch = {
        format = "[on](white) [$symbol$branch]($style) ";
        style = "bright-green";
      };

      git_commit = {
        format = "at [($hash$tag)]($style) ";
        style = "bold bright-green";

        tag_disabled = false;
        tag_symbol = "";
      };

      git_status = {
        format = "([$ahead_behind$staged$modified$untracked$renamed$deleted$conflicted$stashed]($style) )";
        style = "bright-green";

        conflicted = "=$count";
        ahead = "⇡$count";
        behind = "⇣$count";
        diverged = "[⇣$ahead_count⇡$behind_count](yellow)";
        untracked = "?$count";
        stashed = "\\$$count";
        modified = "!$count";
        staged = "+$count";
        renamed = "»$count";
        deleted = "✕$count";
      };

      git_state = {
        format = "now [($state( $progress_current of $progress_total))]($style) ";
        style = "bright-magenta";

        rebase = "rebasing";
        merge = "merging";
        revert = "reverting";
        cherry_pick = "cherry-picking";
        bisect = "bisecting";
        am = "applying mailbox";
        am_or_rebase = "applying mailbox/rebasing";
      };

      fill = {
        symbol = "─";
        style = "bright-green";
      };

      ## Right-aligned modules
      status = {
        format = " [$symbol$status]($style)";
        style = "red";

        pipestatus_format = " \\[ $pipestatus\\] => [($symbol )$common_meaning$signal_name$maybe_int]($style)";
        pipestatus = true;
        pipestatus_separator= "| ";
        disabled = false;
      };
      
      /* Username module must go next to hostname module
       * This is intended to achieve the `username@hostname` format
       */
      username = {
        format = " [w/ ](white)[$user]($style)";
        style_user = "yellow";
        style_root = "red";

        show_always = true;
      };

      hostname = {
        format = "[$hostname]($style)";
        style = "yellow";

        ssh_only = false;
      };

      time = {
        format = " [[at ](white) $time]($style)";
        time_format = "%H:%M:%S";
        style = "blue";
        
        disabled = false;
      };

      cmd_duration = {
        min_time = 1000;
        format = " [[took ](white)$duration](yellow)";
      };

      jobs = {
        format = " [$symbol$number]($style)";
        style = "cyan";

        number_threshold = 1;
        symbol_threshold = 1;
      };
    };
  };
}
