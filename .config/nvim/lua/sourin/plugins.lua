-- This file can be loaded by calling `lua require('plugins')` from your init.vim Only required if you have packer configured as `opt` vim.cmd [[packadd packer.nvim]] return require('packer').startup(function(use) Packer can manage itself use 'wbthomason/packer.nvim'

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy finder Telescope 
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Colorscheme
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
  })

  use { "catppuccin/nvim", as = "catppuccin" }

  -- Colour Preview  
  use {
        "norcalli/nvim-colorizer.lua",
        config = function () require 'colorizer'.setup() end
    }

  --Statusline 
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Treesitter
  use(
      'nvim-treesitter/nvim-treesitter',
      {run = ':TSUpdate'}
  )

  -- Commenting
  use {
      'numToStr/Comment.nvim',
  }

  -- Auto closing brackets and quotes
  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }

  -- LSP
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
          'williamboman/mason.nvim',
          run = function()
              pcall(vim.cmd, 'MasonUpdate')
          end,
          },
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {"hrsh7th/cmp-path"},     -- Optional
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'},     -- Required
          {'onsails/lspkind.nvim'},
      }
  }

  use{
        "lukas-reineke/indent-blankline.nvim",
        config = function ()
            require("indent_blankline").setup{
                char = "|",
                show_current_context = true,
            }
        end
  }



-- Tabnine
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

  use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      requires = {
          { "nvim-tree/nvim-web-devicons" },
      },
  })
end)
