return {
	name = "Run",
	builder = function()
		local outfile = vim.fn.expand("%:p:r")
		return {
			cmd = { outfile },
			{ "on_output_quickfix", open = false },
			"default",
		}
	end,
	condition = {
		filetype = { "c", "cpp" },
	},
}
