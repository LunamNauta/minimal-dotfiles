local module={}
module.init=function()
    module.plugins={barbar=require("barbar")}
    module.opts={
        animation=false,
        clickable=false,
        icons={button=""}
    }
end
module.setup=function()
    module.init()
    module.plugins.barbar.setup(module.opts)
    vim.keymap.set("n", "gt", function() vim.cmd("BufferGoto " .. vim.v.count) end)
end
return module
