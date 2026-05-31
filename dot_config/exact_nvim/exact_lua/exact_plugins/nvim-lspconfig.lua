return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = true,
      exclude = { "vue", "tex" }, -- filetypes for which you don't want to enable inlay hints
    },
    servers = {
      texlab = {
        enabled = false, -- disable texlab by default, it sucks
      },
      -- clangd = {
      --   mason = false, -- uncomment for arm64 machine, see: https://github.com/mason-org/mason-registry/issues/5800
      -- },
    },
  },
}
