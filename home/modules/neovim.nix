{ config, lib, pkgs, ... }:
{

  programs.neovim = {
    enable       = true;
    viAlias      = true;
    vimAlias     = true;
    vimdiffAlias = true;
    withPython3  = true; # for plugins
  };

  xdg.configFile."nvim/init.lua".source                   = ../config/nvim/init.lua;
  xdg.configFile."nvim/lua/compe-completion.lua".source   = ../config/nvim/lua/compe-completion.lua;
  xdg.configFile."nvim/lua/file-icons.lua".source         = ../config/nvim/lua/file-icons.lua;
  xdg.configFile."nvim/lua/gitsigns-nvim.lua".source      = ../config/nvim/lua/gitsigns-nvim.lua;
  xdg.configFile."nvim/lua/mappings.lua".source           = ../config/nvim/lua/mappings.lua;
  xdg.configFile."nvim/lua/misc-utils.lua".source         = ../config/nvim/lua/misc-utils.lua;
  xdg.configFile."nvim/lua/nvim-lspconfig.lua".source     = ../config/nvim/lua/nvim-lspconfig.lua;
  xdg.configFile."nvim/lua/nvimTree.lua".source           = ../config/nvim/lua/nvimTree.lua;
  xdg.configFile."nvim/lua/pluginList.lua".source         = ../config/nvim/lua/pluginList.lua;
  xdg.configFile."nvim/lua/statusline.lua".source         = ../config/nvim/lua/statusline.lua;
  xdg.configFile."nvim/lua/telescope-nvim.lua".source     = ../config/nvim/lua/telescope-nvim.lua;
  xdg.configFile."nvim/lua/top-bufferline.lua".source     = ../config/nvim/lua/top-bufferline.lua;
  xdg.configFile."nvim/lua/treesitter-nvim.lua".source    = ../config/nvim/lua/treesitter-nvim.lua;
  xdg.configFile."nvim/lua/zenmode.lua".source            = ../config/nvim/lua/zenmode.lua;

}
