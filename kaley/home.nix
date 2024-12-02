{ pkgs, ... }:

{

  home.username = "kaley";
  home.homeDirectory = "/home/kaley";

  programs.git = {
    enable = true;
    userName = "TheSlothSage";
    userEmail = "sagehornkaleb@gmail.com";
    extraConfig = {
      credential.helper = "${pkgs.git.override { withLibsecret = true;}}/bin/git-credential-libsecret";
    };
  };

  home.stateVersion = "24.05"; 

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [ 
    
    # font bullshit
    ibm-plex
    nerd-fonts.symbols-only
    nerd-fonts.fira-code
    clipse
  ];

  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
