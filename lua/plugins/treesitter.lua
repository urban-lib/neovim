require('nvim-treesitter.configs').setup {
	ensure_installed = { "typescript", "lua", "go", "python", "tsx", "javascript", "bash" },

	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
}
