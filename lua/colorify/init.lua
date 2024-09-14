local M = {}
local api = vim.api

M.attach = require("colorify.attach")

-- Require config and set default options
local config = require("colorify.config")

-- Setup function
M.setup = function(opts)
	-- Use the config setup function to handle user options
	config.setup(opts)

	-- Access the config values through config.options
	if config.options.colorify.enabled then
		M.run()
	end
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
				M.attach(args.buf, args.event)
			end
		end,
	})
end

return M
