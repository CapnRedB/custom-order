local logging = require("logging")
local logger = logging.getLogger("test_mod")

local function on_enable()
    logger:info("Mod enabled")
end

return {
    on_enable = on_enable
}
