local module={}
module.init=function()
    module.plugins={
        luasnip=require("luasnip"),
        cmp=require("cmp")
    }
    module.opts={
        expand=function(args) module.plugins.luasnip.lsp_expand(args.body) end,
        window={
            completion=module.plugins.cmp.config.window.bordered(),
            documentation=module.plugins.cmp.config.window.bordered()
        },
        mapping = module.plugins.cmp.mapping.preset.insert({
            ["<TAB>"] = module.plugins.cmp.mapping(function(fallback)
                if module.plugins.cmp.visible() then
                    module.plugins.cmp.select_next_item()
                elseif module.plugins.luasnip.expand_or_jumpable() then
                    module.plugins.luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, {"i", "s"}),
            ["<C-SPACE>"]=module.plugins.cmp.mapping.complete(),
            ["<C-e>"]=module.plugins.cmp.mapping.abort(),
            ["<CR>"]=module.plugins.cmp.mapping.confirm({select=false, behavior=module.plugins.cmp.ConfirmBehavior.Replace}),
            ["<DOWN>"]=module.plugins.cmp.mapping(function(fallback)
                module.plugins.cmp.close()
                fallback()
            end, {"i"}),
            ["<UP>"]=module.plugins.cmp.mapping(function(fallback)
                module.plugins.cmp.close()
                fallback()
            end, {"i"}),
        }),
        sources = module.plugins.cmp.config.sources({
            {name="nvim_lsp"},
            {name="luasnip"},
            {name="buffer"}
        })
    }
end
module.setup=function()
    module.init()
    module.plugins.cmp.setup(module.opts)
    module.plugins.cmp.setup.cmdline({"/", "?"}, {mapping=module.plugins.cmp.mapping.preset.cmdline(), sources={name="buffer"}})
    module.plugins.cmp.setup.cmdline(":", {
        mapping=module.plugins.cmp.mapping.preset.cmdline(),
        sources={{name="path"}, {name="cmdline"}},
        matching={disallow_symbol_nonprefix_matching=false}
    })
end
return module
