local module={}
module.init=function()
    module.plugins={
        cmp_nvim_lsp=require("cmp_nvim_lsp"),
        lspconfig=require("lspconfig")
    }
end
module.setup=function()
    module.init()
    local default_capabilities=module.plugins.cmp_nvim_lsp.default_capabilities()
    local default_handlers={
        ["textDocument/hover"]=vim.lsp.with(vim.lsp.handlers.hover, {border="rounded"}),
        ["textDocument/signatureHelp"]=vim.lsp.with(vim.lsp.handlers.signature_help, {border="rounded"}),
    }
    vim.diagnostic.config({virtual_text = false})
    for _, v in ipairs(wvim.languages.mason_lspconfig) do
        local opts=vim.tbl_deep_extend("force", wvim.languages.mason_lspconfig_opts[v] or {}, {capabilities=default_capabilities, handlers=default_handlers})
        module.plugins.lspconfig[v].setup(opts)
    end
end
return module
