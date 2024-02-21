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

-- import telescope actions state safely
local actions_state_setup, action_state = pcall(require, "telescope.actions.state")
if not actions_state_setup then
	return
end

local custom_actions = {}

function custom_actions.fzf_multi_select(prompt_bufnr)
	local function get_table_size(t)
		local count = 0
		for _ in pairs(t) do
			count = count + 1
		end
		return count
	end

	local picker = action_state.get_current_picker(prompt_bufnr)
	local num_selections = get_table_size(picker:get_multi_selection())

	if num_selections > 1 then
		actions.send_selected_to_qflist(prompt_bufnr)
		actions.open_qflist()
	else
		actions.file_edit(prompt_bufnr)
	end
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
			n = {
				["<cr>"] = custom_actions.fzf_multi_select,
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
