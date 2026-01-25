return {
  cmd = { "dart", "language-server", "protocol=lsp" },
  filetypes = { "dart" },
  root_markers = {".git"},
  init_options = {
    closingLables = true,
    flutterOutline = true
  },
  settings = {
    dart = {
      analysisExcludedFolders = {
        vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
        vim.fn.expand("$HOME/.pub-cache"),
        vim.fn.expand("$HOME/tools/flutter/"),
      },
      formatOnSave = true,
      updateImportsOnRename = true,
      --completeFunctionCalls = true,
      --showTodos = true,
    }
  }
}
