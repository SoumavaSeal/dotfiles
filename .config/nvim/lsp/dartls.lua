return {
  cmd = { "dart", "language-server", "protocol=lsp" },
  filetypes = { "dart" },
  root_markers = {"pubspec.yaml", ".git"},
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true
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
      completeFunctionCalls = true,
      showTodos = true
    }
  }
}
