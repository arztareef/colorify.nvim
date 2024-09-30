local options = {
	colorify = {
		enabled = true,
		mode = "virtual", -- fg, bg, virtual
		virt_text = "󱓻 ",
		highlight = { hex = true, lspvars = true },
	},

	cmp = {
		format_colors = {
			tailwind = false, -- will work for css lsp too
			icon = "󱓻",
		},
	},
}
