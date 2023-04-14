{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (nerdfonts.override {
        fonts = [
            "DroidSansMono"
            "FiraCode"
            "Hack"
            "Iosevka"
            "JetBrainsMono"
            "Mononoki"
            "Noto"
            "NerdFontsSymbolsOnly"
        ];
    })
  ];
}
