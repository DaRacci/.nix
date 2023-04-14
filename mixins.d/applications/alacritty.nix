{ pkgs, config, inputs, ... }:

let
    prefs = import ./_preferences.nix { inherit pkgs inputs; };
in
{
    programs.alacritty = {
        enable = true;

        settings = {
            shell = prefs.shell;

            scrolling = {
                history = 999999;
                multiplier = 3;
            }

            env = {
                TERM = "xterm-256color";
            };

            font = {
                normal.family = prefs.appearance.font.monospace.family;
                size = prefs.appearance.font.size;
            };

            window = {
                padding = { x = 5; y = 5; }; # TODO :: DYNAMIC with i3
                dynamic_padding = true;

                decorations = "none";
                opacity = 0.95;
            };

            
          
          #cursor.style = {
          #  shape = "Block";
          #  blinking = "Always";
          #};
          #cursor.blink_interval = 250;
          draw_bold_text_with_bright_colors = colors.bold_as_bright;
          window = {
            opacity = 1.0;
            padding = { x = 5; y = 5; };
          };
          colors = rec {
            primary.foreground = colors.foreground;
            # primary.background = colors.background;
            primary.background = "#111111";

            normal = {
              black = colors.black;
              red = colors.red;
              green = colors.green;
              yellow = colors.yellow;
              blue = colors.blue;
              magenta = colors.purple;
              cyan = colors.cyan;
              white = colors.white;
            };
            bright = {
              black = colors.brightBlack;
              red = colors.brightRed;
              green = colors.brightGreen;
              yellow = colors.brightYellow;
              blue = colors.brightBlue;
              magenta = colors.brightPurple;
              cyan = colors.brightCyan;
              white = colors.brightWhite;
            };
          };
        };
      };
    };
  };
}
