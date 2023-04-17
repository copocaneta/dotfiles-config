local indentbl_setup, indentbl = pcall(require, "indent_blankline")
if not indentbl_setup then
	return
end

-- configure autopairs
indentbl.setup()
