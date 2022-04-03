-- ██╗   ██╗███████╗███████╗██████╗ 
-- ██║   ██║██╔════╝██╔════╝██╔══██╗
-- ██║   ██║███████╗█████╗  ██████╔╝
-- ██║   ██║╚════██║██╔══╝  ██╔══██╗
-- ╚██████╔╝███████║███████╗██║  ██║
--  ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝
--
-- ██╗   ██╗ █████╗ ██████╗ ██╗ █████╗ ██████╗ ██╗     ███████╗███████╗
-- ██║   ██║██╔══██╗██╔══██╗██║██╔══██╗██╔══██╗██║     ██╔════╝██╔════╝
-- ██║   ██║███████║██████╔╝██║███████║██████╔╝██║     █████╗  ███████╗
-- ╚██╗ ██╔╝██╔══██║██╔══██╗██║██╔══██║██╔══██╗██║     ██╔══╝  ╚════██║
--  ╚████╔╝ ██║  ██║██║  ██║██║██║  ██║██████╔╝███████╗███████╗███████║
--   ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝╚══════╝

local home = os.getenv("HOME")

local _M =
{
    browser = "yandex-browser-stable",
    terminal = "kitty",
    filemanager = "dolphin",

    modkey = "Mod4",

    wallpaper = "~/Picture/Wallpapers/default.png",
}

return _M