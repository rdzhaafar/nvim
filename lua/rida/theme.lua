
-- Set colorscheme based on current system time
function set_colorscheme()
	local MORNING = 8
	local EVENING = 19
	local LIGHT_COLORSCHEME = "github_light"
	local DARK_COLORSCHEME = "github_dark"

	local hour_string = os.date("%H")
	local hour = tonumber(hour_string)
	if hour > MORNING and hour < EVENING then
		vim.cmd.colorscheme(LIGHT_COLORSCHEME)
	else
		vim.cmd.colorscheme(DARK_COLORSCHEME)
	end
end

local colorscheme_timer = vim.loop.new_timer()
local MINUTE = 60 * 1000
colorscheme_timer:start(0, MINUTE, vim.schedule_wrap(set_colorscheme))

vim.opt.termguicolors = true

vim.opt.guifont = "Inconsolata:h18"

