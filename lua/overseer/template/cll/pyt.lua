return {
	name = "Run Python",
	builder = function()
		local outfile = vim.fn.expand("%:p")
		return {
			cmd = { "python3", outfile },
			{ "on_output_quickfix", open = false },
			"default",
		}
	end,
	condition = {
		filetype = { "python" },
	},
}
