local plug = function(repo, opts)
	-- Loads plugins via vim fn
	opts = opts or vim.empty_dict()
	vim.fn["plug#"](repo, opts)
end

local plugin_loader = {}

function plugin_loader.load(all_plugins)
	vim.fn["plug#begin"](vim.fn.stdpath("data") .. "/plugged")
	for _, plugin in ipairs(all_plugins) do
        print(plugin.repo)
		plug(plugin.repo, plugin.opts)
		-- plugin.config()
	end
	vim.fn["plug#end"]()
end

return plugin_loader
