{ config, lib, pkgs, inputs, ... }:

let
    prefs = import ./_preferences.nix { inherit inputs config lib pkgs; };
in {
    qt = {
        enable = true;
        platformTheme = "gnome";

        style = {
            package = pkgs.adwaita-qt;
            name = "adwaita-dark"
        };
    };
}
