{ config, pkgs, ... }:

{

    home.packages = with pkgs; [ geoclue2 ];

    services.geoclue2 = {
        enable = true;
    };

    services.redshift = {
        enable = true;
        tray = false;

        temperature = {
            day = 5500;
            night = 3700;
        };
        
        dawnTime = "6:00-7:00";
        duskTime = "18:30-19:30";
        provider = "geoclue2";
    };
}
