return {
	name = "Run HTML",
	builder = function()
		return {
			cmd = { "live-server" },
			{ "on_output_quickfix", open = false },
			"default",
		}
	end,
	condition = {
		filetype = { "html" },
	},
}
