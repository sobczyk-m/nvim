local opts = {
  filetypes = {
    '*',
    -- Excluded filteypes.
    '!lazy', -- Commit hashes get highlighted sometimes.
  },
  user_default_options = {
    RGB = true, -- #RGB hex codes.
    RRGGBB = true, -- #RRGGBB hex codes.
    RRGGBBAA = true, -- #RRGGBBAA hex codes.
    AARRGGBB = true, -- 0xAARRGGBB hex codes.

    -- "Name" codes like Blue or blue. It is pretty annoying when you have maps with
    -- 'blue = color_hex': you get two previews, one for the key and one for the value.
    names = false,

    rgb_fn = true, -- CSS rgb() and rgba() functions.
    hsl_fn = true, -- CSS hsl() and hsla() functions.
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB.
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn.

    -- Available methods are false / true / "normal" / "lsp" / "both"
    -- True is same as normal
    tailwind = 'both',
    -- Available modes for `mode`: foreground, background,  virtualtext

    mode = 'background',
    virtualtext = '■',
    -- update color values even if buffer is not focused
    -- example use: cmp_menu, cmp_docs
    -- always_update = false
  },
}

return {
  'NvChad/nvim-colorizer.lua',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = opts,
}
