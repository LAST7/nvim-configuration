local opt = {
        noremap = true,
        silent = true,
}

local map = vim.api.nvim_set_keymap


-- set leader-key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- use "jj" to return to Normal mode
map("i", "jj", "<Esc>", opt)

-- H/L for beginning/end of the line
map("n", "H", "^", opt)
map("n", "L", "$", opt)


-- set <C-u> and <C-d> to move up/down 9 lines
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- indent code blocks in visual mode with ">"
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- split window with "s"
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "sc", ":<C-w>c", opt)
map("n", "so", ":<C-w>o", opt)  -- close other windows


-------------------------------------

-- plugin keyboard bindings
local pluginKeys = {}

pluginKeys.cmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  return {
    -- previous one
    ['<UP>'] = cmp.mapping.select_prev_item(),
    -- next one
    ['<DOWN>'] = cmp.mapping.select_next_item(),
    -- show completion
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- cancel
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- confirmation
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({
      select = true ,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),

    -- super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    -- end of super Tab
  }
end



return pluginKeys
