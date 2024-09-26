local wezterm = require("wezterm")
local config = {}

-- setting
config.use_ime = true
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false

-- font
config.font = wezterm.font("Moralerspace Argon NF", {
	-- family = "JetBrains Mono",
	-- family = "SauceCodePro Nerd Font Mono",
	-- family = "Source Code Pro",
	weight = "Regular",
})
config.font_size = 12.5

-- config.font_rules = {
-- 	{
-- 		intensity = "Normal",
-- 		italic = true,
-- 		font = wezterm.font("Moralerspace Argon NF", {
-- 			weight = "Regular",
-- 		}),
-- 	},
-- 	{
-- 		intensity = "Bold",
-- 		italic = true,
-- 		font = wezterm.font("Moralerspace Argon NF", {
-- 			weight = "Bold",
-- 		}),
-- 	},
-- }

-- color
-- config.color_scheme = "Tokyo Night (Gogh)"
config.color_scheme = "Tokyo Night Moon"
-- config.colors = {
-- 	cursor_bg = "#565f89",
-- }
-- config.window_background_opacity = 0.85

-- link
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "SHIFT",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "w",
		mods = "SUPER|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
}

config.enable_kitty_graphics = true

config.hyperlink_rules = wezterm.default_hyperlink_rules()
table.insert(config.hyperlink_rules, {
	regex = "\\b\\w+://(?:[\\w.-]+):\\d+\\S*\\b",
	format = "$0",
})

config.set_environment_variables = {
	COLORTERM = "truecolor",
}

return config
