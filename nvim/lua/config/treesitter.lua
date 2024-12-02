local module={}
module.init=function()
    module.plugins={nvim_treesitter_configs=require("nvim-treesitter.configs")}
    module.opts={
        ensure_installed=wvim.languages.treesitter,
        highlight={enable=true}
    }
end
module.setup=function()
    module.init()
    module.plugins.nvim_treesitter_configs.setup(module.opts)
end
return module
