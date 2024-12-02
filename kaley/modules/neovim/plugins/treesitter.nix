{ pkgs, ... }:

{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars ++ [ ]; 
      nixvimInjections = true;

      settings = {
        auto_install = true;
        highlight.enable = true;
        indent.enable = true;
      };
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };

    hmts.enable = true;
  };
}
