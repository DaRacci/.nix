{ config, pkgs, ... }:

with programs; {
    go {
        enable = true;
        goPath = ""${config.xdg.dataHome}/go";
    };

    java {
        enable = true;
        package = pkgs.jdk;
    };

    vscode {
        enable = true;
        package = pkgs.vscodium;
        extensions = [ ];
        userSettings = {
            
        };
    };
};
