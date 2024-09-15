local M = {}
local api = vim.api

-- Require config and set default options
local config = require("colorify.config")

M.run = function(opts)
	api.nvim_create_autocmd({
		"TextChanged",
		"TextChangedI",
		"TextChangedP",
		"VimResized",
		"LspAttach",
		"WinScrolled",
		"BufEnter",
	}, {
		callback = function(args)
			M.options = vim.tbl_deep_extend("force", require("colorify.config"), opts)
			if vim.bo[args.buf].bl then
				require("colorify.attach")(args.buf, args.event)
			end
		end,
	})
end

-- Setup function
M.setup = function(setup)
	if config.options.colorify.enabled then
		M.run(setup)
	end
end

return M
