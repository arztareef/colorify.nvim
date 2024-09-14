local M = {}

M.options = {
	colorify = {
		enabled = true,
		mode = "bg", -- fg, bg, virtual
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

return M
