local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- COLORS (Catppuccin Mocha)
config.colors = {
  foreground = "#cdd6f4",
  background = "#1e1e2e",
  cursor_bg = "#f5e0dc",
  cursor_fg = "#1e1e2e",
  cursor_border = "#f5e0dc",
  selection_bg = "#585b70",
  selection_fg = "#cdd6f4",

  ansi = {
    "#45475a", -- black
    "#f38ba8", -- red
    "#a6e3a1", -- green
    "#f9e2af", -- yellow
    "#89b4fa", -- blue
    "#f5c2e7", -- purple
    "#94e2d5", -- cyan
    "#bac2de", -- white
  },

  brights = {
    "#585b70", -- bright black
    "#f38ba8", -- bright red
    "#a6e3a1", -- bright green
    "#f9e2af", -- bright yellow
    "#89b4fa", -- bright blue
    "#f5c2e7", -- bright purple
    "#94e2d5", -- bright cyan
    "#a6adc8", -- bright white
  },
}

-- PERFORMANCE
config.front_end = "OpenGL"
config.prefer_egl = true
config.max_fps = 144
config.animation_fps = 1

-- CURSOR
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 500
config.term = "xterm-256color"

-- SHELL: WSL
config.default_prog = { "wsl.exe", "~" }

-- FONT
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16.0
config.cell_width = 0.9

-- VISUAL
config.window_background_opacity = 0.65
config.text_background_opacity = 1.00
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 8,
  right = 8,
  top = 4,
  bottom = 4,
}
config.initial_cols = 100
config.window_close_confirmation = 'NeverPrompt'

-- Enable scroll back using mouse wheel
config.enable_scroll_bar = true

-- Set scrollback size (increase if you need more history)
config.scrollback_lines = 10000

-- Add hyperlink support (allows clicking links)
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Enable ligatures
config.harfbuzz_features = {"calt", "liga", "dlig", "ss01"}

-- Focus follows mouse
config.pane_focus_follows_mouse = true

-- TABS
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- WINDOW FRAME
config.window_frame = {
  font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Regular" }),
  active_titlebar_bg = "#0c0b0f",
}

config.keys = {
  {
    key = "h",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.SplitPane({
      direction = "Right",
      size = { Percent = 50 },
    }),
  },
  {
    key = "v",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.SplitPane({
      direction = "Down",
      size = { Percent = 50 },
    }),
  },
  {
    key = "U",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize({ "Left", 5 }),
  },
  {
    key = "I",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize({ "Down", 5 }),
  },
  {
    key = "O",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize({ "Up", 5 }),
  },
  {
    key = "P",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize({ "Right", 5 }),
  },
  {
    key = "n",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.SpawnWindow,
  },
  -- Cola com Ctrl+V
  {
    key = "v",
    mods = "CTRL",
    action = act.PasteFrom("Clipboard"),
  },
  -- Copia com Ctrl+C (só quando tem algo selecionado)
  {
    key = "c",
    mods = "CTRL",
    action = act.CopyTo("Clipboard"),
  },
}

return config
