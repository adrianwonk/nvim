vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    root_markers = { "compile_commands.json", "compile_flags.txt", ".clangd", ".git" },
})
vim.lsp.enable("clangd")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local buf = args.buf
        vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        local map = function(lhs, rhs) vim.keymap.set("n", lhs, rhs, { buffer = buf }) end
        map("gd", vim.lsp.buf.definition)
        map("gD", vim.lsp.buf.declaration)
        map("gr", vim.lsp.buf.references)
        map("gi", vim.lsp.buf.implementation)
        map("K",  vim.lsp.buf.hover)
        map("<leader>rn", vim.lsp.buf.rename)
        map("<leader>ca", vim.lsp.buf.code_action)
        map("<leader>f",  function() vim.lsp.buf.format({ async = true }) end)
        map("[d", function() vim.diagnostic.jump({ count = -1 }) end)
        map("]d", function() vim.diagnostic.jump({ count =  1 }) end)
    end,
})
