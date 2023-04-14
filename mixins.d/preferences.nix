{ pkgs, inputs, ... }:

rec {
    shell = "nushell";
    editor = rec {
        terminal = "micro";
        ide = "vscode";
    };
    
    appearance = rec {
        font = rec {
            size = 18;
            default = serif;
        
            sans = { family = "Fira Sans"; package = pkgs.fira; };
            serif = { family = "Fira Serif"; package = pkgs.fira; };
            monospace = { family = "JetBrainsMono Nerd Font"; package = pkgs.nerdfonts; };
            fallback = { family = "NerdFontsSymbolsOnly"; package = pkgs.nerdfonts; };
            emoji = { family = "emojione"; package = pkgs.emojione; };
        };

        iconTheme = { name = "Adwaita-dark"; package = pkgs.gnome.adwaita-icon-theme; };
        cursorTheme = { name = "Bibata-Modern-Ice"; size = 32; package = pkgs.bibata-cursors; };
    };
}
