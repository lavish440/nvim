return {
	name = "Run Javascript with NodeMon",
	builder = function()
		local outfile = vim.fn.expand("%:p")
		return {
			cmd = { "nodemon", outfile },
			{ "on_output_quickfix", open = false },
			"default",
		}
	end,
	condition = {
		filetype = { "javascript" },
	},
}
