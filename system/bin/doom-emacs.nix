{ pkgs, userSettings, ... }:

let
  main = ''
    #!/usr/bin/env sh
    emacsclient -c -a 'emacs'
  '';
in { environment.systemPackages = [ (pkgs.writeScriptBin "doom-emacs" main) ]; }
