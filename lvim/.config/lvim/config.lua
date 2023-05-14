-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.list = true
vim.opt.listchars:append({
  space = "·",
  trail = "·",
  tab = ">→",
})

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}

-- keymappings
lvim.leader = ","
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["jj"] = "<ESC>"

-- which-key mappings
lvim.builtin.which_key.mappings["gwf"] = {
  "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", "Git worktrees"
}

-- colorscheme and alpha settings
lvim.colorscheme = "carbonfox"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

-- treesitter settings
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- treesitter settings
lvim.builtin.treesitter.auto_install = true

-- linters and formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
}

-- additional plugins
lvim.plugins = {
  { "christoomey/vim-tmux-navigator" },
  { "EdenEast/nightfox.nvim" },
  { 'ThePrimeagen/git-worktree.nvim' },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        transparent_background = true,
      })
    end
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  {
    'prettier/vim-prettier',
    build = 'yarn install --frozen-lockfile --production',
    ft = { 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml',
      'html' }
  }
}

-- custom icons
lvim.icons.ui.Folder = "󰉋"
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.folder.default = lvim.icons.ui.Folder

vim.cmd("au VimLeave * set guicursor=a:ver100")
