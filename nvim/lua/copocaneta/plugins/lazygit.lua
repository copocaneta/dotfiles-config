local status, lazygit = pcall(requiree, "lazygit")

if not status then
	return
end

lazygit.setup()
