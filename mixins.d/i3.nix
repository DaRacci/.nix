{ configs, pkgs, ... }:

{
    xsession {
        enable = true;
        preferStatusNotifierItems = true;

        windowManager.i3 {
            enable = false;
            config = {
                assigns = {
                    "0: terminal" = [{ class = "^alacritty$"; }];
                };
                colors = {
                    
                };
            };
        };
    };

    programs.eww {
        enable = false;
        package = null; # TODO :: WIP notifications branch
        configDir = "./eww-panel";
    };

    programs.rofi {
        enable = false;
        package = pkgs.rofi.override { plugins = [ pkgs.rofi-emoji ]; };
        plugins = with pkgs; [ rofi-emoji rofi-calc rofi-vpn rofi-systemd rofi-bluetooth rofi-power-menu rofi-pulse-select ]
        configPath = "${config.xdg.configHome}/rofi/config.rasi";

        font = null; # TODO :: Find how to use variables in nix.
        location = "bottom";
        terminal = "${pkgs.alacritty}/bin/alacritty"
        theme = null;
    };

    services.dunst {
        enable = true;

        iconTheme = {
            name = "Adwaita";
            package = "pkgs.gnome.adwaita-icon-theme";
            size = "128x128";
        };

        settings = {
            global = {
                follow = "mouse";
                width = 300;
                height = 300;
                offset = "30x50";
                origin = "top-right";
                transparency = 10;
                frame_color = "#eceff1";
                font = "Droid Sans 9";
            };

            urgency_normal = {
                background = "#37474f";
                foreground = "#eceff1";
                timeout = 10;
            };
        };
    };

    services.flameshot {
        enable = false;
        settings = {
            
        };
    };

    services.picom {
        enable = true;
        backend = "glx";
        extraArgs = [ "--experimental-backends" ];
        vSync = true;

        fade = true;
        fadeDelta = 6;
        fadeSteps = [ 0.03 0.03 ];
        fadeExclude = [ ];

        settings = {
            # TODO :: VERIFY THESE ARE GOOD TO KEEP
            glx-no-stencil = true;
            glx-no-rebind-pixmap = true;
            use-damage = false;

            mark-wmwin-focused = true;
            mark-ovredir-focused = true;
            use-ewmh-active-win = true;
            detect-rounded-corners = true;
            detect-client-opacity = true;
            unredir-if-possible = false;
            detect-transient = true;
            detect-client-leader = true;

            # corner-radius = 10;
            rounded-corners-exclude = [
                "class_g = 'eww-panel'"
                "widthb > 2559 && heightb > 1407" 
            ];

            blur-method = "gaussian";
            blur-size = 3;
            blur-deviatioin = 0.94089642;
            blur-strength = 0.2;

            blur-background = true;
            blur-background-frame = true;
            blur-background-fixed = false;
        };
    };

    services.playerctld {
        enable = true;
    };
};
