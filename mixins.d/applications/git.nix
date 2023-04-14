{ config, pkgs, ... }:

{
    programs.git {
        enable = true;
        aliases = { };
        delta {
            enable = true;
            options = {
                decorations = {
                    commit-decoration-style = "bold yellow box ul";
                    file-decoration-style = "none";
                    file-style = "bold yellow ul";
                    syntax-theme = "TwoDark";
                };
                features = "decorations";
                whitespace-error-style = "22 reverse";
            };
        };
        hooks = {
            pre-commit = "";
        };
        ignores = [ ];
        signing {
            signByDefault = true
            gpgPath = "/opt/1Password/op-ssh-sign"
            key = ""
        };
        userEmail = "me@racci.dev";
        userName = "DaRacci";
    };

    programs.gh {
        enable = true;
        extensions = with pkgs; [ gh-dash gh-cal ];
        settings = {
            git_protocol = "ssh";
            prompt = "enabled";
        };
    };

    programs.gitui {
        enable = true;
        keyConfig = ''
          exit: Some(( code: Char('c'), modifiers: ( bits: 2,),)),
          quit: Some(( code: Char('q'), modifiers: ( bits: 0,),)),
          exit_popup: Some(( code: Esc, modifiers: ( bits: 0,),)),
        ''
    }
};
