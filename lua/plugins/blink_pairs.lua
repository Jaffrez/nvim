local pairs = require("blink.pairs")

if not pairs.library_available() then
    pairs.build():pwait(60000)
end

pairs.setup({
    highlights = {
        groups = {},
    },
})
