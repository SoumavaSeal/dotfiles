return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            ensure_installed = { "c", "html", "javascript", "tsx", "lua", "typescript", "css", "dart" },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
        -- Code Folding
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldlevel = 99
    end
}
