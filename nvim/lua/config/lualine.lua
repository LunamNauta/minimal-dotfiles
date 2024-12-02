local module={}
module.init=function()
    module.plugins={lualine=require("lualine")}
end
module.setup=function()
    module.init()
    module.plugins.lualine.setup()
end
return module
