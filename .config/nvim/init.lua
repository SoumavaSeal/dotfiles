require("options")
require("keymap")
require("config.lazy")
require("lsp")

vim.cmd("colorscheme rose-pine");

-- Override specific highlight groups to have no background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })      -- Main editor background
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- Floating windows background
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })  -- Sign column background
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" }) -- Trailing space background color
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })    -- Non-current window background
