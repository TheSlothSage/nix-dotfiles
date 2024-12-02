{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      file-browser = {
        enable = true; 
      };
    };

    keymaps = { 

      "<S-F>f" = {
        mode = "n";
        action = "find_files";
        options.desc = "Find Files";
      };
      
      "<S-F>g" = {
        mode = "n";
        action = "live_grep";
        options.desc = "Grep Files";
      };
      
      "<S-F>b" = {
        mode = "n";
        action = "buffers";
        options.desc = "Find Buffer";
      }; 
      "<S-F>h" = {
        mode = "n";
        action = "help_tags";
        options.desc = "Find Help";
      };
      "<S-F>d" = {
        mode = "n";
        action = "diagnostics";
        options.desc = "Find Diagnostics";
      };
      "<S-F>t" = {
        mode = "n";
        action = "treesitter";
        options.desc = "Find Treesitter";
      };
      "<S-F>m" = {
        mode = "n";
        action = "marks";
        options.desc = "Find Marks";
      };
    }; 
  };
}
