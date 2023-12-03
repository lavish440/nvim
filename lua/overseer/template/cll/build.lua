-- /home/stevearc/.config/nvim/lua/overseer/template/user/cpp_build.lua
-- return {
-- 	name = "Build and Run",
-- 	builder = function()
-- 		-- Full path to current file (see :help expand())
-- 		local file = vim.fn.expand("%:p")
-- 		return {
-- 			cmd = { "g++" },
-- 			args = { file },
-- 			components = { { "on_output_quickfix", open = true }, "default" },
-- 		}
-- 	end,
-- 	condition = {
-- 		filetype = { "cpp" },
-- 	},
-- }

-- Note: this is untested so it may require some fiddling
return {
	name = "Build and Run",
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
					task_names = { { cmd = "g++", args = { file, "-Wall", "-Wextra", "-o", outfile } } },
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
