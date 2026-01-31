{ config, lib, pkgs, ... }:

{
  imports = [
    ./c/c.nix
    ./go/go.nix
    ./sh/sh.nix
    ./lua/lua.nix
    ./nix/nix.nix
    ./rust/rust.nix
  ];
}
