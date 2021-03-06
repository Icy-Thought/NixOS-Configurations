{ config, lib, pkgs, ... }:

let
  plugins = pkgs.vimPlugins;

  myVimPlugins = with plugins; [

    # Themes
    #challenger-deep-theme
    
    # General
    lightline-vim
    vim-startify                                       # Start-page
    vim-fugitive                                       # Git-wrapper
    ultisnips
    
    # Code Formatting
    auto-pairs
    vim-surround                                       # Quoting/Paranthesizing made simple!
    vim-polyglot
    vim-nix

    # Neovim-Nightly LSP
    nvim-lspconfig
    lsp_extensions-nvim
    completion-nvim
    diagnostic-nvim
    
  ];

  baseConfig    = builtins.readFile ./init.vim;
  pluginsConfig = builtins.readFile ./plugins.vim;
  vimConfig     = baseConfig + pluginsConfig;

in
 {
  programs.neovim = {
    enable       = true;
    package      = pkgs.neovim-nightly;
    extraConfig  = vimConfig;
    plugins      = myVimPlugins;
    viAlias      = true;
    vimAlias     = true;
    vimdiffAlias = true;
    withPython   = true; # for plugins
    withPython3  = true; # for plugins
  };

}
