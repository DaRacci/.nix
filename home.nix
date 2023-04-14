{ config, pkgs, ... }:

# let unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };

{
  home.username = "racci";
  home.homeDirectory = "/home/racci";

  home.language = {
    base = null;
    measurement = null;
    messages = null;
    monetary = null;
    time = null;
  };

  xdg = {
    enable = true;

    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";

    userDirs = {
        enable = true;
        createDirectories = true;

        documents = "${config.home.homeDirectory}/Documents";
        download = "${config.home.homeDirectory}/Downloads";
        templates = "${config.home.homeDirectory}/Templates";

        music = "${config.home.homeDirectory}/Media/Music";
        pictures = "${config.home.homeDirectory}/Media/Pictures";
        videos = "${config.home.homeDirectory}/Media/Videos";
        
        desktop = null;
        publicShare = null;
    };
  };

  home.packages = with pkgs; [
    # Terminal/Shell
    # nushell         # Default Shell
    # alacritty       # Terminal Emulator

    # 

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  ##########################################################################################
  #                                                                                        #
  #                             DO NOT MODIFY BELOW THIS POINT                             #
  #                                                                                        #
  ##########################################################################################
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.
}
