-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "zenburn"
-- config.color_scheme = "Desert"
-- config.color_scheme = "DimmedMonokai"
-- config.color_scheme = "zenwritten_dark"
-- config.color_scheme = "Fairy Floss (Gogh)"
-- config.color_scheme = "Fairy Floss Dark (Gogh)"
-- config.color_scheme = "Palenight (Gogh)"
-- config.color_scheme = "Ocean (dark) (terminal.sexy)"
-- config.color_scheme = "Ocean (light) (terminal.sexy)"
-- config.color_scheme = "Ocean Dark (Gogh)"
-- config.color_scheme = "Ivory Dark (terminal.sexy)"
-- config.color_scheme = "iceberg-dark"
-- config.color_scheme = "tokyonight"
-- config.color_scheme = "Tokyo Night Storm (Gogh)"
config.color_scheme = "Tokyo Night Storm"
-- config.color_scheme = "tokyonight_moon"
-- config.color_scheme = "tokyonight_night"
-- config.color_scheme = "Tomorrow (dark) (terminal.sexy)"

-- config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true })
config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("Fira Code Retina")
-- config.font_size = 16.0
-- config.font_size = 15.0
config.font_size = 14.0

local act = wezterm.action

config.keys = {
	-- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
	{
		key = "LeftArrow",
		mods = "OPT",
		action = act.SendKey({
			key = "b",
			mods = "ALT",
		}),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = act.SendKey({ key = "f", mods = "ALT" }),
	},
}

-- and finally, return the configuration to wezterm
return config
