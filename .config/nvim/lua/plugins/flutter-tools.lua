return {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
        require("flutter-tools").setup {} -- use defaults
        vim.keymap.set('n', '<leader>fe', ':FlutterEmulators<CR>', { desc = 'Flutter Emulators'})
        vim.keymap.set('n', '<leader>fR', ':FlutterRun<CR>', { desc = 'Flutter Run'})
    end
}
