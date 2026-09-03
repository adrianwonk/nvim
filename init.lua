vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.lsp")

vim.opt.termguicolors = true
vim.opt.hlsearch = true
vim.cmd.colorscheme("rose-pine-moon")
vim.opt.laststatus = 2

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.linebreak = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.mouse = ""


vim.opt.scrolloff = 10

vim.opt.cmdheight = 1
vim.opt.shortmess:append("aoOtT")

vim.opt.guicursor = "a:block"

vim.keymap.set("n", "<leader>w", "<C-w>w", { desc = "Cycle Windows" })

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

hi("Normal",       { bg = "NONE", ctermbg = "NONE" })
hi("NonText",      { bg = "NONE", ctermbg = "NONE" })
hi("EndOfBuffer",  { bg = "NONE", ctermbg = "NONE" })
hi("LineNr",       { bg = "NONE", ctermbg = "NONE" })
hi("SignColumn",   { bg = "NONE", ctermbg = "NONE" })

hi("CursorLine",   { bg = "#3a3a3a", ctermbg = 237 })
hi("CursorLineNr", { italic = true, fg = "#af0000", ctermfg = 124, bg = "#3a3a3a", ctermbg = 237 })
hi("LineNrAbove",  { italic = true, fg = "#6c7a89", ctermfg = 66 })
hi("LineNrBelow",  { italic = true, fg = "#ffafd7", ctermfg = 218 })

vim.api.nvim_create_augroup("netrw_silent", { clear = true })
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro cul"

vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float()
end, { desc = "Show diagnostics under cursor" })vim.keymap.set("n", "<leader>q", ":w<CR>:Explore<CR>")

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("i", "<C-j>", function() return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>" end, { expr = true })

vim.keymap.set("i", "<C-k>", function() return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>" end, { expr = true })

