local module={}
module.init=function()
    module.plugins={
        telescope_actions=require("telescope.actions"),
        telescope=require("telescope")
    }
    module.opts={
        extensions={
            file_browser={
                hijack_netrw=true,
                mappings={
                    ["i"]={
                        ["<ESC>"]=module.plugins.telescope_actions.close
                    }
                }
            },
            fzf={
                fuzzy=true,
                override_generic_sorter=true,
                override_file_sorter=true
            }
        }
    }
end
module.setup=function()
    module.init()
    module.plugins.telescope.setup(module.opts)
    module.plugins.telescope.load_extension("file_browser")
    module.plugins.telescope.load_extension("fzf")
    vim.keymap.set("n", "<LEADER>ff", "<CMD>Telescope file_browser<CR>")
end
return module
