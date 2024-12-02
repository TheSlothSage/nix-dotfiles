{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;

    targets.waybar.enable = false;

    targets.kitty.variant256Colors = true;

    polarity = "dark";
    image = ./wallpaper.jpg;

    fonts = {
      emoji = {
        package = pkgs.noto-fonts-emoji; 
	      name = "Noto Color Emoji";
      };

      monospace = {
        package = pkgs.ibm-plex;
	      name = "IBM Plex Mono";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
	      name = "DejaVu Sans";
      }; 
      
      serif = {
        package = pkgs.dejavu_fonts;
	      name = "DejaVu Serif"; 
      };

      sizes = {
        applications = 14;
	      desktop = 14;
	      popups = 14;
	      terminal = 14;
      };
    };
  }; 

}
