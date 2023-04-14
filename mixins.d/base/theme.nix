{ config, pkgs, ... }:

{
    home.pointerCursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 32;

        gtk.enable = true;
        x11.enable = true;
    };

    gtk = {
        enable = true;
        theme = {
            package = null;
            name = "Adwaita-dark";
        };

        iconTheme = {
            name = "Adwaita-dark";
            package = pkgs.gnome.adwaita-icon-theme;
        };

        font = {
            package = pkgs.fira;
            name = "FiraSans";
            size = 18;
        };
        gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    };

    qt = {
        enable = true;
        platformTheme = "gnome";
        style = {
            package = pkgs.adwaita-qt;
            name = "adwaita-dark";
        };
    };
}
