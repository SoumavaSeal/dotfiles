return {
    "rebelot/kanagawa.nvim",
    opts = {
        compile = false,             -- enable compiling the colorscheme
        undercurl = true,            -- enable undercurls
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false},
        statementStyle = { bold = false },
        typeStyle = {},
        transparent = false,         -- do not set background color
        dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
        terminalColors = true,       -- define vim.g.terminal_color_{0,17}
        colors = {                   -- add/modify theme and palette colors
            palette = {},
            theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
            return {}
        end,
        theme = "dragon",            -- Load "wave" theme
        background = {               -- map the value of 'background' option to a theme
            dark = "dragon",         -- try "dragon" !
            light = "lotus"
        },
    },
    init = function()
        vim.cmd.colorscheme('kanagawa-dragon')
    end
}
