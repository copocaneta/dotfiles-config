require("dap-vscode-js").setup({
	-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug",
	adapters = {
		"chrome",
		"pwa-node",
		"pwa-chrome",
		"pwa-msedge",
		"node-terminal",
		"pwa-extensionHost",
		"node",
		"chrome",
	},
})
