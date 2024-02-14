-- Local module for VSCode integration functions
vscode_integration = {}

local M = {}

local augroup = vim.api.nvim_create_augroup
local keymap = vim.api.nvim_set_keymap

function vscode_integration.split(direction, file)
	if direction == "h" then
		vim.fn.VSCodeCall("workbench.action.splitEditorDown")
	else
		vim.fn.VSCodeCall("workbench.action.splitEditorRight")
	end

	if file and file ~= "" then
		vim.fn.VSCodeExtensionNotify("open-file", vim.fn.expand(file), "all")
	end
end

function vscode_integration.splitNew(direction, file)
	vscode_integration.split(direction, file == "" and "__vscode_new__" or file)
end

function vscode_integration.closeOtherEditors()
	vim.fn.VSCodeNotify("workbench.action.closeEditorsInOtherGroups")
	vim.fn.VSCodeNotify("workbench.action.closeOtherEditors")
end

function vscode_integration.manageEditorSize(count, to)
	for i = 1, count or 1 do
		vim.fn.VSCodeNotify(
			to == "increase" and "workbench.action.increaseViewSize" or "workbench.action.decreaseViewSize"
		)
	end
end

local function notify(cmd)
	return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
end

local function v_notify(cmd)
	return string.format("<cmd>call VSCodeNotifyVisual('%s', 1)<CR>", cmd)
end

-- Commands
vim.api.nvim_create_user_command("Split", function(args)
	vscode_integration.split("h", args.args)
end, { nargs = "?" })
vim.api.nvim_create_user_command("Vsplit", function(args)
	vscode_integration.split("v", args.args)
end, { nargs = "?" })
vim.api.nvim_create_user_command("New", function()
	vscode_integration.split("h", "__vscode_new__")
end, { nargs = "?" })
vim.api.nvim_create_user_command("Vnew", function()
	vscode_integration.split("v", "__vscode_new__")
end, { nargs = "?" })
vim.api.nvim_create_user_command("Only", function(args)
	if args.bang then
		vscode_integration.closeOtherEditors()
	else
		vim.fn.VSCodeNotify("workbench.action.joinAllGroups")
	end
end, { bang = true })

-- Key mappings using the local module
local function set_keymaps()
	local opts = { noremap = true, silent = true }
	vim.api.nvim_set_keymap("n", "<Space>sh", '<Cmd>lua vscode_integration.split("h", "")<CR>', opts)
	vim.api.nvim_set_keymap("x", "<Space>sh", '<Cmd>lua vscode_integration.split("h", "")<CR>', opts)
	vim.api.nvim_set_keymap("n", "<Space>sv", '<Cmd>lua vscode_integration.split("v", "")<CR>', opts)
	vim.api.nvim_set_keymap("x", "<Space>sv", '<Cmd>lua vscode_integration.split("v", "")<CR>', opts)
	vim.api.nvim_set_keymap(
		"n",
		"<Space>sx",
		'<Cmd>lua vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")<CR>',
		opts
	)
	vim.api.nvim_set_keymap(
		"x",
		"<Space>sx",
		'<Cmd>lua vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")<CR>',
		opts
	)
	vim.api.nvim_set_keymap("n", "<C-w>n", '<Cmd>lua vscode_integration.splitNew("h", "__vscode_new__")<CR>', opts)
	vim.api.nvim_set_keymap("x", "<C-w>n", '<Cmd>lua vscode_integration.splitNew("h", "__vscode_new__")<CR>', opts)
	vim.api.nvim_set_keymap(
		"n",
		"<C-w>=",
		'<Cmd>lua vim.fn.VSCodeNotify("workbench.action.evenEditorWidths")<CR>',
		opts
	)
	vim.api.nvim_set_keymap(
		"x",
		"<C-w>=",
		'<Cmd>lua vim.fn.VSCodeNotify("workbench.action.evenEditorWidths")<CR>',
		opts
	)
	vim.api.nvim_set_keymap(
		"n",
		"<C-w>>",
		'<Cmd>lua vscode_integration.manageEditorSize(vim.v.count, "increase")<CR>',
		opts
	)
	vim.api.nvim_set_keymap(
		"x",
		"<C-w>>",
		'<Cmd>lua vscode_integration.manageEditorSize(vim.v.count, "increase")<CR>',
		opts
	)
	vim.api.nvim_set_keymap(
		"n",
		"<C-w><",
		'<Cmd>lua vscode_integration.manageEditorSize(vim.v.count, "decrease")<CR>',
		opts
	)
	vim.api.nvim_set_keymap(
		"x",
		"<C-w><",
		'<Cmd>lua vscode_integration.manageEditorSize(vim.v.count, "decrease")<CR>',
		opts
	)
	vim.api.nvim_set_keymap(
		"n",
		"<C-w>-",
		'<Cmd>lua vscode_integration.manageEditorSize(vim.v.count, "decrease")<CR>',
		opts
	)
	vim.api.nvim_set_keymap(
		"x",
		"<C-w>-",
		'<Cmd>lua vscode_integration.manageEditorSize(vim.v.count, "decrease")<CR>',
		opts
	)
	vim.api.nvim_set_keymap("n", "<C-j>", '<Cmd>lua vim.fn.VSCodeNotify("workbench.action.navigateDown")<CR>', opts)
	vim.api.nvim_set_keymap("x", "<C-j>", '<Cmd>lua vim.fn.VSCodeNotify("workbench.action.navigateDown")<CR>', opts)
	vim.api.nvim_set_keymap("n", "<C-k>", '<Cmd>lua vim.fn.VSCodeNotify("workbench.action.navigateUp")<CR>', opts)
	vim.api.nvim_set_keymap("x", "<C-k>", '<Cmd>lua vim.fn.VSCodeNotify("workbench.action.navigateUp")<CR>', opts)
	vim.api.nvim_set_keymap("n", "<C-h>", '<Cmd>lua vim.fn.VSCodeNotify("workbench.action.navigateLeft")<CR>', opts)
	vim.api.nvim_set_keymap("x", "<C-h>", '<Cmd>lua vim.fn.VSCodeNotify("workbench.action.navigateLeft")<CR>', opts)
	vim.api.nvim_set_keymap("n", "<C-l>", '<Cmd>lua vim.fn.VSCodeNotify("workbench.action.navigateRight")<CR>', opts)
	vim.api.nvim_set_keymap("x", "<C-l>", '<Cmd>lua vim.fn.VSCodeNotify("workbench.action.navigateRight")<CR>', opts)
	vim.api.nvim_set_keymap("x", "<C-/>", "<Cmd>lua Comment()<CR>", opts)
	vim.api.nvim_set_keymap("n", "<C-/>", "<Cmd>lua Comment()<CR>", opts)
	vim.api.nvim_set_keymap(
		"n",
		"<C-w>_",
		'<Cmd>lua vim.fn.VSCodeNotify("workbench.action.toggleEditorWidths")<CR>',
		opts
	)
	vim.api.nvim_set_keymap("n", "<Space>w", '<Cmd>lua vim.fn.VSCodeNotify("whichkey.show")<CR>', opts)
	vim.api.nvim_set_keymap("x", "<Space>w", '<Cmd>lua vim.fn.VSCodeNotify("whichkey.show")<CR>', opts)

	keymap("n", "<Space>xr", notify("references-view.findReferences"), { silent = true }) -- language references
	keymap("n", "<Space>xd", notify("workbench.actions.view.problems"), { silent = true }) -- language diagnostics
	keymap("n", "gr", notify("editor.action.goToReferences"), { silent = true })
	keymap("n", "<Space>rn", notify("editor.action.rename"), { silent = true })
	keymap("n", "<Space>fm", notify("editor.action.formatDocument"), { silent = true })
	keymap("n", "<Space>ca", notify("editor.action.refactor"), { silent = true }) -- language code actions

	keymap("n", "<Space>rg", notify("workbench.action.findInFiles"), { silent = true }) -- use ripgrep to search files
	keymap("n", "<Space>ts", notify("workbench.action.toggleSidebarVisibility"), { silent = true })
	keymap("n", "<Space>th", notify("workbench.action.toggleAuxiliaryBar"), { silent = true }) -- toggle docview (help page)
	keymap("n", "<Space>tp", notify("workbench.action.togglePanel"), { silent = true })
	keymap("n", "<Space>fc", notify("workbench.action.showCommands"), { silent = true }) -- find commands
	keymap("n", "<Space>ff", notify("workbench.action.quickOpen"), { silent = true }) -- find files
	keymap("n", "<Space>tw", notify("workbench.action.terminal.toggleTerminal"), { silent = true }) -- terminal window

	keymap("v", "<Space>fm", v_notify("editor.action.formatSelection"), { silent = true })
	keymap("v", "<Space>ca", v_notify("editor.action.refactor"), { silent = true })
	keymap("v", "<Space>fc", v_notify("workbench.action.showCommands"), { silent = true })
end

set_keymaps()
