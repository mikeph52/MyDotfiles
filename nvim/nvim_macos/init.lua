-- Load lazy.nvim plugin manager
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
  -- UI & Themes
  { "nvim-lualine/lualine.nvim" },          -- statusline
  { "nvim-tree/nvim-web-devicons" },        -- icons
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },                    -- colorscheme

  -- File Navigation
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-tree/nvim-tree.lua" },            -- file explorer

  -- LSP & Autocompletion
  { "neovim/nvim-lspconfig" },              -- LSP configs
  { "hrsh7th/nvim-cmp" },                   -- completion
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },                   -- snippets

  -- Syntax & Highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Git
  { "lewis6991/gitsigns.nvim" },
})

-- ==============================
-- General Settings
-- ==============================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.termguicolors = true

require("catppuccin").setup({
  flavour = "mocha", -- latte | frappe | macchiato | mocha
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
    },
    telescope = true,
    nvimtree = true,
    cmp = true,
    gitsigns = true,
    lualine = true,
  },
})


-- Colorscheme
vim.cmd("colorscheme catppuccin-mocha")

-- ==============================
-- Keymaps
-- ==============================
local map = vim.keymap.set
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "File Explorer" })

-- ==============================
-- LSP Setup (Example: Python & C)
-- ==============================
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("pyright", {
  capabilities = capabilities,
})

vim.lsp.config("clangd", {
  capabilities = capabilities,
})

vim.lsp.config("bashls", {
  capabilities = capabilities,
})


require("nvim-treesitter.configs").setup {
  ensure_installed = { "bash", "lua", "python", "c" },
  highlight = { enable = true },
}

