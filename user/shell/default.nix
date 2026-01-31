{ config, lib, pkgs, userSettings, ... }:

let
  Aliases = {
    # cd
    ".." = "cd ..";
    repos = "cd $HOME/repos";
    dl = "cd $HOME/Downloads";

    # cp, mv,rm 
    cp = "cp -v";
    mv = "mv -v";
    rm = "rm -v";

    # df,free
    df = "df -h";
    free = "free -h";

    # ls
    ls = "eza --color=auto --icons --group-directories-first";
    ll = "eza -l --color=auto --icons --group-directories-first";
    lla = "eza -la --color=auto --icons --group-directories-first";

    # ip 
    ip = "ip --color=auto";

    # grep 
    grep = "grep --color=auto";

    # du
    du = "dust -r";
  };

  SessionVars = {
    BROWSER = userSettings.browser;
    EDITOR = userSettings.editor;
    TERMINAL = userSettings.term;
    GRIM_DEFAULT_DIR = "$HOME/Pictures/screen";

    HISTCONTROL = "ignoreboth";
    HISTFILESIZE = "5000";
  };

  cfg = config.userSettings.shell;
in {
  options.userSettings.shell = {
    enable = lib.mkEnableOption "Enable bash config";

  };

  config = lib.mkIf cfg.enable {

    programs.bash = {
      enable = true;
      historySize = 5000;
      historyFileSize = 5000;
      shellAliases = Aliases;
      sessionVariables = SessionVars;
      bashrcExtra = ''
        set -o vi
        [ -f "$HOME/.cache/wallust/sequences" ] && cat $HOME/.cache/wallust/sequences 
      '';
      profileExtra = ''
        [[ -d $HOME/scripts ]] && export PATH="$PATH:$HOME/scripts"
        [[ -d $HOME/.local/bin/ ]] && export PATH="$PATH:$HOME/.local/bin"
        [[ -d $HOME/go/bin/ ]] && export PATH="$PATH:$HOME/go/bin"
        [[ -d $HOME/.cargo/bin/ ]] && export PATH="$PATH:$HOME/.cargo/bin"
        [[ -d $HOME/.config/emacs/bin/ ]] && export PATH="$PATH:$HOME/.config/emacs/bin"
      '';
    };
  };
}

