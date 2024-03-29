local available, lualine = pcall(require, "lualine")

local options = {
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			"packer",
			"neo-tree",
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { right = "" } },
		},
		lualine_b = { "diagnostics" },
		lualine_c = {},
		lualine_x = { "encoding", "filetype" },
		lualine_y = { "progress" },
		lualine_z = {
			{ "location" },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				--show_filename_only = true,
				icons_enabled = true,
				symbols = {
					modified = " ●", -- Text to show when the buffer is modified
					alternate_file = "󰖰", -- Text to show to identify the alternate file
					directory = "", -- Text to show when the buffer is a directory
				},
			},
		},
		lualine_b = { "branch", "diff" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "tabs" },
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {
		"neo-tree",
	},
}

lualine.setup(options)
