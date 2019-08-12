-- Standard awesome library
local awful = require("awful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get ()
  -- Table of layouts to cover with awful.layout.inc, order matters.
  local layouts = {
    awful.layout.suit.tile,               --  1:
    awful.layout.suit.tile.left,          --  2:
    awful.layout.suit.tile.bottom,        --  3:
    awful.layout.suit.tile.top,           --  4:

    awful.layout.suit.fair,               --  5:
    awful.layout.suit.fair.horizontal,    --  6:

    awful.layout.suit.spiral,             --  7:

    awful.layout.suit.max,                --  8:
    awful.layout.suit.magnifier,          --  9:

    awful.layout.suit.corner.nw,          -- 10:

    awful.layout.suit.floating,           -- 11:

--  awful.layout.suit.spiral.dwindle,
--  awful.layout.suit.max.fullscreen,
--  awful.layout.suit.corner.ne,
--  awful.layout.suit.corner.sw,
--  awful.layout.suit.corner.se,
  }

  return layouts
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
