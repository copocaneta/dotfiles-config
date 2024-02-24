--  bootstrap lazy.nvim, LazyVim and your plugins
 if vim.g.vscode then
 	-- VSCode extension
 	require("config.vscodesettings")
 else
    require("config.lazy")
 end

