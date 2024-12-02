local module={}
module.init=function()
    module.plugins={
        notify=require("notify"),
        noice=require("noice")
    }
    module.opts={
        notify={top_down=false},
        noice={
            presets={
                bottom_search=false,
                command_palette={
                    views={
                        cmdline_popup={
                            position={row = "2", col = "50%"},
                            size={min_width = 60, width = "auto", height = "auto"}
                        }
                    }
                }
            }
        }
    }
end
module.setup=function()
    module.init()
    module.plugins.notify.setup(module.opts.notify)
    module.plugins.noice.setup(module.opts.noice)
end
return module
