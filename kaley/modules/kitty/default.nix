{

  programs.kitty = {
    enable = true;

    settings = {

      shell = "fish";
      editor = "nvim";

      linux_display_server = "wayland";
      wayland_enable_ime = true;

      remember_window_size = false;
      
      active_border_color = "none";
      hide_window_decorations = true;
      initial_window_width = "900";
      initial_window_height = "1080";

      tab_bar_style = "hidden";

      close_on_child_death = true;

      mouse_hide_wait = 3; 
      open_url_with = "brave";
      url_style = "curly";
      url_prefixes = "file ftp ftps gemini git gopher http https irc ircs kitty mailto news sftp";                  
      underline_hyper_links = "hover";
      strip_trailing_spaces = "smart";
      select_by_word_characters = "@-./_~?&=%+#";
     

      window_padding_width = 5;
      
    };

    extraConfig = ''
      dynamic_background_opacity yes
    '';
  };

}

