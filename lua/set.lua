
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = false

vim.opt.ignorecase = true
vim.o.smartcase = true
vim.opt.autoindent = true
vim.opt.scrolloff = 8

vim.o.undofile = true

vim.o.completeopt = 'menuone,noselect'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Saved macros
vim.cmd([[
    :let @a = "iHello\<CR>bye\<Esc>"
]])

