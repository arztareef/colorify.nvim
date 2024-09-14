local M = {}
local api = vim.api

-- Require config and set default options
local config = require("colorify.config")

-- Setup function
M.setup = function()
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
				require("colorify.attach")(args.buf, args.event)
			end
		end,
	})
end

return M
