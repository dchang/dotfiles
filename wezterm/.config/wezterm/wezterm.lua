local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'kanagawabones'
config.default_domain = 'WSL:Ubuntu-22.04'
config.font = wezterm.font 'JetBrainsMonoNL Nerd Font Mono'
config.font_size = 9.5
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.disable_default_key_bindings = true

return config
