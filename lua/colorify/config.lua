local options = {
	colorify = {
		enabled = true,
		mode = "virtual", -- fg, bg, virtual
		virt_text = " ",
		highlight = { hex = true, lspvars = true },
	},

	cmp = {
		format_colors = {
			tailwind = true, -- will work for css lsp too
			icon = "",
		},
	},
}

return options
