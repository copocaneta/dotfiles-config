-- EasyMotion Configuration

-- Disable default mappings
vim.g.EasyMotion_do_mapping = 0

-- Turn on case-insensitive feature
vim.g.EasyMotion_smartcase = 1

-- JK motions: Line motions
vim.api.nvim_set_keymap("n", "<Leader>j", "<Plug>(easymotion-j)", {})
vim.api.nvim_set_keymap("n", "<Leader>k", "<Plug>(easymotion-k)", {})

-- s{char}{char} to move to {char}{char}
vim.api.nvim_set_keymap("n", "s", "<Plug>(easymotion-s2)", {})
-- TODO: Add separate section for vscode

-- General mappings
vim.api.nvim_set_keymap("n", "<Leader>f", "<Plug>(easymotion-overwin-f)", {})
-- vim.api.nvim_set_keymap("n", "n", "<Plug>(easymotion-next)", {})
-- vim.api.nvim_set_keymap("n", "N", "<Plug>(easymotion-prev)", {})
vim.api.nvim_set_keymap("n", "S", "<Plug>(easymotion-overwin-t)", {})

-- Move to line
vim.api.nvim_set_keymap("n", "<Leader>l", "<Plug>(easymotion-overwin-line)", {})

-- Move to word
vim.api.nvim_set_keymap("n", "<Leader>w", "<Plug>(easymotion-overwin-w)", {})

-- Highlight links
vim.cmd([[
  hi link EasyMotionTarget ErrorMsg
  hi link EasyMotionShade Comment

  hi link EasyMotionTarget2First MatchParen
  hi link EasyMotionTarget2Second MatchParen

  hi link EasyMotionMoveHL Search
  hi link EasyMotionIncSearch Search
]])
