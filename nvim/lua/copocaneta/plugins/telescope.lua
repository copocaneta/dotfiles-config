-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		layout_strategy = "vertical",
		-- layout_strategy = "flex",
		previewer = true,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		layout_config = {
			height = vim.o.lines,
			width = vim.o.columns,
			prompt_position = "bottom",
			-- preview_height = 0.4,
		},
		mappings = {
			i = {
				["<C-p>"] = require("telescope.actions.layout").toggle_preview,
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

telescope.load_extension("fzf")
