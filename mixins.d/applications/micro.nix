{ config, pkgs, ... }:

with programs.micro; {
    enable = true;
    settings = {
        autoindent = true;
        autosu = true;
        backupdir = "${config.xdg.cacheHome}/micro/backups";
        clipboard = "external";
        diffgutter = true;
        mkparents = true;
        savehistory = true;
        saveundo = true;
        sucmd = "sudo";
        tabstospaces = true;
    };
};
