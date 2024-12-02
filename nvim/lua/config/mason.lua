local module={}
module.init=function()
    module.plugins={
        mason_lspconfig=require("mason-lspconfig"),
        mason=require("mason")
    }
    module.opts={
        mason={},
        mason_lspconfig={
            ensure_installed=wvim.languages.mason_lspconfig,
            highlight={enable=true}
        }
    }
end
module.setup=function()
    module.init()
    module.plugins.mason.setup(module.opts.mason)
    module.plugins.mason_lspconfig.setup(module.opts.mason_lspconfig)
end
return module
