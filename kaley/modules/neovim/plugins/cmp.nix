{
  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings.sourcse = [
      { name = "nvim_lsp";   }
      { name = "treesitter"; }
      { name = "luasnip";    }
      { name = "path";       }
      { name = "buffer";     } 
      { name = "copilot";    }
      { name = "luasnip";    }
    ];
  };  
}
