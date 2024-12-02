wvim={}
wvim.languages={}
wvim.languages.treesitter={"cpp", "c", "lua"}
wvim.languages.mason_lspconfig={"clangd", "lua_ls"}
wvim.languages.mason_lspconfig_opts={
    ["lua_ls"]={settings={Lua={diagnostics={globals={"vim"}}}}},
}

vim.opt.autochdir=true
vim.opt.number=true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.cmdheight=0
vim.opt.wrap=false
vim.opt.foldlevel=999
vim.opt.foldenable=false

vim.g.mapleader=" "
vim.g.localmapleader="\\"

require("plugin_manager")

vim.keymap.set("n", "<LEADER>tn", "<CMD>tabnew<CR>")
vim.keymap.set("n", "<LEADER>tk", "<CMD>bdelete<CR>")
vim.keymap.set("n", "<LEADER>di", vim.lsp.buf.hover)
vim.keymap.set("n", "<LEADER>de", function() vim.diagnostic.open_float({border="rounded"}) end)
vim.keymap.set("n", "<LEADER>ddef", vim.lsp.buf.definition)
vim.keymap.set("n", "<LEADER>dtyp", vim.lsp.buf.type_definition)

vim.api.nvim_create_autocmd({"FileType"}, {
    callback = function()
        if require("nvim-treesitter.parsers").has_parser() then
            vim.opt.foldmethod="expr"
            vim.opt.foldexpr="nvim_treesitter#foldexpr()"
        else vim.opt.foldmethod = "syntax" end
    end,
})
vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {command="set foldmethod=expr"})

return wvim
