local logging = require("logging")
local logger = logging.getLogger("quick_reroll2")

local function on_enable()
end

local function on_disable()
end

local function menu()
end

local function on_game_load(args)
    logger:info("Hello!")
end

local function on_game_quit()
end

local function on_key_pressed(key)
end

local function on_key_released(key)
end

local function on_mouse_pressed(button, x, y, touch)
end

local function on_mouse_released(button, x, y)
end

local function on_mousewheel(x, y)
end

local function on_pre_render()
end

local function on_post_render()
end

local function on_error(message)
end

local function on_pre_update(dt)
end

local function on_post_update(dt)
end

return {
    on_enable = on_enable,
    on_disable = on_disable,
    menu = menu,
    on_game_load = on_game_load,
    on_game_quit = on_game_quit,
    on_key_pressed = on_key_pressed,
    on_key_released = on_key_released,
    on_mouse_pressed = on_mouse_pressed,
    on_mouse_released = on_mouse_released,
    on_mousewheel = on_mousewheel,
    on_pre_render = on_pre_render,
    on_post_render = on_post_render,
    on_error = on_error,
    on_pre_update = on_pre_update,
    on_post_update = on_post_update,
}
