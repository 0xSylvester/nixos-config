{ config, lib, pkgs, ... }:

{
  imports = [ ./c ./go ./js ./sh ./lua ./nix ./rust ];
}
