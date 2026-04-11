vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.opt.number = true

-- Disable providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

--luasnip binds
vim.api.nvim_set_keymap("i", "<C-k>", "<Plug>luasnip-expand-or-jump", { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-k>", "<Plug>luasnip-expand-or-jump", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>luasnip-jump-next", { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-j>", "<Plug>luasnip-jump-next", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-l>", "<Plug>luasnip-jump-prev", { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-l>", "<Plug>luasnip-jump-prev", { noremap = true, silent = true })



-- Keybinding to toggle terminal
vim.api.nvim_set_keymap("n", "t", ":ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<Esc>t", [[<C-\><C-n>:ToggleTerm<CR>]], { noremap = true, silent = true })
-- Keymap for diagnostics
vim.api.nvim_set_keymap("n", "<leader>e", ":lua vim.diagnostic.setqflist()<CR>", { noremap = true, silent = true })

-- Indent with Tab
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = true, silent = true })

-- Unindent with Shift+Tab
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
