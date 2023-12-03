return {
	name = "Build and Run (Debug)",
	builder = function()
		-- Full path to current file (see :help expand())
		local file = vim.fn.expand("%:p")
		local outfile = vim.fn.expand("%:p:r") --[[ .. ".out" ]]
		return {
			cmd = { outfile },
			components = {
				-- Note that since we're using the "raw task parameters" format for the dependency,
				-- we don't have to define a separate build task.
				{
					"dependencies",
					task_names = {
						{ cmd = "g++", args = { "-Wall", "-Wextra", "-g3", "-O0", file, "-o", outfile } },
					},
				},
				{ "on_output_quickfix", open = false },
				"default",
			},
		}
	end,
	condition = {
		filetype = { "cpp" },
	},
}
