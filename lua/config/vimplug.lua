local data_dir = vim.fn.stdpath("data") .. "/site"
if vim.fn.empty(vim.fn.glob(data_dir .. "/autoload/plug.vim")) == 1 then
    vim.fn.system({
        "curl", "-fLo", data_dir .. "/autoload/plug.vim", "--create-dirs",
        "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
    })
    vim.api.nvim_create_autocmd("VimEnter", {
        command = "PlugInstall --sync | source $MYVIMRC",
    })
end

vim.cmd([[
    call plug#begin('~/.vim/plugged')
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    call plug#end()
]])
