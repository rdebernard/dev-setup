return { -- Highlight, edit, and navigate code
	"ggandor/leap.nvim",
	config = function()
		require("leap").create_default_mappings()
	end,
}
