{ config, pkgs, ... }:

{
    programs.nushell = {
        enable = false;
    };

    programs.starship = {
        enable = false;
        enableNushellIntegration = true;
        settings = {
            
        };
    };

    programs.zoxide = {
        enable = false;
        enableNushellIntegration = true;
    };

    services.pueue = {
        enable = true;
        settings = {
            daemon = {
                default_parallel_tasks = 16;
            };
        };
    };
}
