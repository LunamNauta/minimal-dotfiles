local module={}
module.init=function()
    module.plugins={catppuccin=require("catppuccin")}
    module.opts={
        flavour="mocha",
        transparent_background=false,
        no_italic=true,
        no_bold=true,
        no_underline=true
    }
end
module.setup=function()
    module.init()
    module.plugins.catppuccin.setup(module.opts)
    vim.cmd.colorscheme("catppuccin")
end
return module
