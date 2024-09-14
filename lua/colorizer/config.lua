local M = {}

M.options = {
	colorify = {
		enabled = true,
		mode = "virtual", -- fg, bg, virtual
		virt_text = "󱓻 ",
		highlight = { hex = true, lspvars = true },
	},
	cmp = {
		format_colors = {
			tailwind = true, -- will work for css lsp too
			icon = "󱓻",
		},
	},
}

-- Setup function to override default options
M.setup = function(opts)
	-- Deep merge the user's options with the default ones
	M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M
