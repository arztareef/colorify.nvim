local M = {}

M.default_options = {
	colorify = {
		enabled = true,
		mode = "virtual", -- fg, bg, virtual
		virt_text = "󱓻 ",
		highlight = { hex = true, lspvars = true },
	},
	cmp = {
		format_colors = {
			tailwind = true, -- will work for css lsp too
			icon = "",
		},
	},
}

M.options = {}

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.default_options, opts or {})
end

return M
