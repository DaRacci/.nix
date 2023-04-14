{ config, lib, pkgs, inputs, ... }:

let
    prefs = import ./_preferences.nix { inherit inputs config lib pkgs; };
in
{
    gtk = {
        enable = true;

        font = {
            package = prefs.appearance.font.default.package;
            name = prefs.appearance.font.default.family;
            size = prefs.appearance.font.size;
        };

        
        theme = {
            package = null;
            name = "Adwaita-dark";
        };


        iconTheme = prefs.appearance.iconTheme;
        cursorTheme = prefs.appearance.cursorTheme;
        
        gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
        gtk2.extraConfig = {
#            gtk-application-prefer-dark-theme = 1;
            gtk-xft-hinting = 1;
            gtk-xft-hintstyle = "slight";
            gtk-xft-antialias = 1;
        };

        gtk3.extraConfig = gtk2.extraConfig;
        gtk4.extraConfig = gtk3.extraConfig;

        # TODO :: Extra CSS Config
    };
}
