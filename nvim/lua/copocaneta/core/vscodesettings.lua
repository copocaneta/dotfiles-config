-- Local module for VSCode integration functions
vscode_integration = {}

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
end

set_keymaps()
