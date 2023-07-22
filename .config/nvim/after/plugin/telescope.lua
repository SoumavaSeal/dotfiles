local builtin = require('telescope.builtin')

-- Keybindings
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>kl', ':Telescope keymaps<CR>')
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({search = vim.fn.input("Search > ")})
end)
