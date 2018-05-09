---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local theme_path = gfs.get_configuration_dir().."themes/default/"

local theme = {}

theme.font          = "Roboto 10"
theme.taglist_font  = "Roboto Condensed Regular 8"

theme.bg_normal     = "#006db3"
theme.bg_focus      = "#039be5"
theme.bg_urgent     = "#e53935"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#ffffff"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme_path.."submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = theme_path.."titlebar/close_normal.png"
theme.titlebar_close_button_normal_hover = theme_path.."titlebar/close_normal_hover.png"
theme.titlebar_close_button_normal_press = theme_path.."titlebar/close_normal_press.png"
theme.titlebar_close_button_focus  = theme_path.."titlebar/close_focus.png"
theme.titlebar_close_button_focus_hover = theme_path.."titlebar/close_focus_hover.png"
theme.titlebar_close_button_focus_press = theme_path.."titlebar/close_focus_press.png"

theme.titlebar_minimize_button_normal = theme_path.."titlebar/minimize_normal.png"
theme.titlebar_minimize_button_normal_hover = theme_path.."titlebar/minimize_normal_hover.png"
theme.titlebar_minimize_button_normal_press = theme_path.."titlebar/minimize_normal_press.png"
theme.titlebar_minimize_button_focus  = theme_path.."titlebar/minimize_focus.png"
theme.titlebar_minimize_button_focus_hover = theme_path.."titlebar/minimize_focus_hover.png"
theme.titlebar_minimize_button_focus_press = theme_path.."titlebar/minimize_focus_press.png"

theme.titlebar_maximized_button_normal_inactive = theme_path.."titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_normal_inactive_hover = theme_path.."titlebar/maximized_normal_inactive_hover.png"
theme.titlebar_maximized_button_normal_inactive_press = theme_path.."titlebar/maximized_normal_inactive_press.png"
theme.titlebar_maximized_button_focus_inactive  = theme_path.."titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_focus_inactive_hover = theme_path.."titlebar/maximized_focus_inactive_hover.png"
theme.titlebar_maximized_button_focus_inactive_press = theme_path.."titlebar/maximized_focus_inactive_press.png"

theme.titlebar_maximized_button_normal_active = theme_path.."titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_normal_active_hover = theme_path.."titlebar/maximized_normal_active_hover.png"
theme.titlebar_maximized_button_normal_active_press = theme_path.."titlebar/maximized_normal_active_press.png"
theme.titlebar_maximized_button_focus_active  = theme_path.."titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_focus_active_hover = theme_path.."titlebar/maximized_focus_active_hover.png"
theme.titlebar_maximized_button_normal_active_press = theme_path.."titlebar/maximized_normal_active_press.png"


theme.wallpaper = theme_path.."background.png"
--theme.wallpaper = "~/.config/awesome/themes/default/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = theme_path.."layouts/fairhw.png"
theme.layout_fairv = theme_path.."layouts/fairvw.png"
theme.layout_floating  = theme_path.."layouts/floatingw.png"
theme.layout_magnifier = theme_path.."layouts/magnifierw.png"
theme.layout_max = theme_path.."layouts/maxw.png"
theme.layout_fullscreen = theme_path.."layouts/fullscreenw.png"
theme.layout_tilebottom = theme_path.."layouts/tilebottomw.png"
theme.layout_tileleft   = theme_path.."layouts/tileleftw.png"
theme.layout_tile = theme_path.."layouts/tilew.png"
theme.layout_tiletop = theme_path.."layouts/tiletopw.png"
theme.layout_spiral  = theme_path.."layouts/spiralw.png"
theme.layout_dwindle = theme_path.."layouts/dwindlew.png"
theme.layout_cornernw = theme_path.."layouts/cornernww.png"
theme.layout_cornerne = theme_path.."layouts/cornernew.png"
theme.layout_cornersw = theme_path.."layouts/cornersww.png"
theme.layout_cornerse = theme_path.."layouts/cornersew.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = 'adapta'

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80