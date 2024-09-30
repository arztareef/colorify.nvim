local M = {}
local api = vim.api

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

M.setup = function()
	M.run()
end

M.cmp_attach = function(e, i)
	require("colorify.format").tailwind(e, i)
end

return M
