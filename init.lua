require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4        -- number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4     -- spaces for autoindent
vim.opt.expandtab = true   -- convert tabs to spaces
vim.opt.smartindent = true -- smarter autoindenting

-- Search
vim.opt.smartcase = true   -- ...unless you use capitals
vim.opt.incsearch = true   -- show matches as you type
vim.opt.hlsearch = true    -- highlight search results

-- UI
vim.opt.signcolumn = "yes" -- always show the sign column (for LSP diagnostics, git, etc.)
vim.opt.wrap = false       -- don’t wrap long lines
vim.opt.scrolloff = 8      -- keep 8 lines visible above/below cursor
vim.opt.sidescrolloff = 8  -- keep 8 columns visible left/right of cursor

-- Undo
vim.opt.undofile = true    -- persistent undo across sessions

-- Performance
vim.opt.updatetime = 250   -- faster CursorHold events (useful for LSP)
vim.opt.timeoutlen = 400   -- faster keymap timeout


-- Normal line numbers in edit mode
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = false
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = true
  end,
})

-- highlight after yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})

