vim.opt.number = true
vim.opt.relativenumber = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.showmode = false -- lualine already shows it
-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

require 'vini'

vim.api.nvim_create_user_command('CustomCommand', function()
  print 'This is a custom command! :)'
  return 'olá'
end, {})

local callback = function(args)
  local lines = {}

  --vim.api.nvim_set_current_line('olá')
  -- detect if the user includes a bang
  if args.bang == true then
    table.insert(lines, 'bang was used')
  else
    table.insert(lines, 'bang was not used')
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, true, lines)
end

vim.api.nvim_create_user_command('Bang', callback, {
  nargs = 0,
  desc = 'User Command with bang',
  -- enable bang detection
  bang = true,
})
