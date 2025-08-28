return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
    },
    config = function()
      require("quarto").setup {
        lspFeatures = {
          enabled = true,
          languages = { "r", "python", "julia", "bash" },
          diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" },
          },
          completion = {
            enabled = true,
          },
        },
      }
    end,
  },
}
