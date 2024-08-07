" Title:        BuildScript Plugin
" Description:  A plugin to provide a quicklist to execute build script
" command
" Last Change:  7 October 2023
" Maintainer:   kosekidev <https://github.com/kosekidev>

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_buildscript_plugin")
    finish
endif
let g:loaded_buildscript_plugin = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/build_script/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

" Exposes the plugin's functions for use as commands in Neovim.
command! -nargs=0 OpenBuildScripts lua require("build_script").open_quicklist()
