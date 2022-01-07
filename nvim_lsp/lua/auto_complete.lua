-- Auto completion

local cmp = require('cmp')

vim.o.completeopt = "menuone,noselect"

-- local check_back_space = function()
  -- local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  -- return col == 0 or vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') ~= nil
-- end

-- local mapping = {
  -- ['<Tab>'] = function(fallback)
    -- if vim.fn.pumvisible() == 1 then
      -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n', true)
    -- elseif check_back_space() then
      -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n', true)
    -- elseif vim.fn['vsnip#available']() == 1 then
      -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true), '', true)
    -- else
      -- fallback()
    -- end
  -- end,
-- }


local mapping = {
  ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
}

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = mapping,
    sources = {
        { name = 'buffer', priority = 1 },
        { name = 'path', priority = 2},
        { name = 'nvim_lsp', priority = 3 },
        { name = 'vsnip', priority = 4 },
        { name = 'nvim_lua', priority = 5},
        { name = 'tags' }
    }
})
