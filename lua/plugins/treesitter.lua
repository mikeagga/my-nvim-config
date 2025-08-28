return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- runs :TSUpdate after install
  event = { "BufReadPost", "BufNewFile" }, -- lazy-load on file open
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
    "markdown",
    "markdown_inline",
    "yaml",
    "r",
    "python",
    "julia",
    "bash",
    "c",
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
