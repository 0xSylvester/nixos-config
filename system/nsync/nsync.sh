#!/usr/bin/env bash

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

DotFiles="@dotfiles@"
HostName="@hostname@"

print_help() {
    echo -e "${BLUE}Usage: nsync [mode] [action]${NC}"
    echo ""
    echo "Modes:"
    echo -e "  ${GREEN}user${NC}             Apply home-manager changes"
    echo -e "  ${GREEN}system [action]${NC}  Apply system changes (test, boot, switch)"
    echo -e "  ${GREEN}update${NC}           Update flake.lock"
    echo ""
    echo "Cleanup Modes:"
    echo -e "  ${GREEN}gc${NC}               Delete generations older than 7 days"
    echo -e "  ${GREEN}opt${NC}              Optimize the Nix store (hard-link duplicates)"
    echo -e "  ${GREEN}clean${NC}            Run GC and Optimize together"
}

user_sync() {
    cd $DotFiles || exit
    nh home switch . -b bak
    #notify-sent Nixos "Home build Done"
}

system_sync() {
    cd $DotFiles || exit
    case $1 in
    test)
        nh os test . -H $HostName
        ;;
    boot)
        nh os boot . -H $HostName
        ;;
    switch)
        nh os switch . -H $HostName
        ;;
    *) print_help ;;
    esac
}

run_gc() {
    #echo -e "${YELLOW}Deleting generations older than 7 days...${NC}"
    nh clean all
}

run_opt() {
    echo -e "${BLUE}Optimizing Nix store (hard-linking duplicates)...${NC}"
    nix store optimise
}

# Main Logic
case $1 in
user) user_sync ;;
system) system_sync "$2" ;;
update) cd "@dotfiles@" && nix flake update ;;
gc) run_gc ;;
opt) run_opt ;;
clean) run_gc && run_opt ;;
*) print_help ;;
esac
