local M = {}
local api = vim.api
local config = require("colorify.config")

-- Deep merge function
local function deep_merge(orig, overrides)
	for k, v in pairs(overrides) do
		if type(v) == "table" and type(orig[k] or false) == "table" then
			deep_merge(orig[k], v)
		else
			orig[k] = v
		end
	end
	return orig
end

M.run = function()
	api.nvim_create_autocmd({
		"TextChanged",
		"TextChangedI",
		"TextChangedP",
		"VimResized",
		"LspAttach",
		"WinScrolled",
		"BufEnter",
	}, {
		-- callback = function(args)
		callback = function(args)
			if vim.bo[args.buf].bl then
				require("colorify.attach")(args.buf, args.event)
			end
		end,
	})
end

M.setup = function(opts)
	-- Merge user options with the default config
	config = deep_merge(config, opts or {})
	M.run()
end

M.cmp_attach = function(e, i)
	require("colorify.format").tailwind(e, i)
end

return M
