{ config, lib, pkgs, ... }:
{

  programs.neovim = {
    enable       = true;
    viAlias      = true;
    vimAlias     = true;
    vimdiffAlias = true;
    withPython3  = true; # for plugins
  };

  xdg.configFile = {
    "nvim/init.lua".source                   = ../config/nvim/init.lua;
    "nvim/lua/compe-completion.lua".source   = ../config/nvim/lua/compe-completion.lua;
    "nvim/lua/file-icons.lua".source         = ../config/nvim/lua/file-icons.lua;
    "nvim/lua/gitsigns-nvim.lua".source      = ../config/nvim/lua/gitsigns-nvim.lua;
    "nvim/lua/mappings.lua".source           = ../config/nvim/lua/mappings.lua;
    "nvim/lua/misc-utils.lua".source         = ../config/nvim/lua/misc-utils.lua;
    "nvim/lua/nvim-lspconfig.lua".source     = ../config/nvim/lua/nvim-lspconfig.lua;
    "nvim/lua/nvimTree.lua".source           = ../config/nvim/lua/nvimTree.lua;
    "nvim/lua/pluginList.lua".source         = ../config/nvim/lua/pluginList.lua;
    "nvim/lua/statusline.lua".source         = ../config/nvim/lua/statusline.lua;
    "nvim/lua/telescope-nvim.lua".source     = ../config/nvim/lua/telescope-nvim.lua;
    "nvim/lua/top-bufferline.lua".source     = ../config/nvim/lua/top-bufferline.lua;
    "nvim/lua/treesitter-nvim.lua".source    = ../config/nvim/lua/treesitter-nvim.lua;
    "nvim/lua/zenmode.lua".source            = ../config/nvim/lua/zenmode.lua;
  };

}
