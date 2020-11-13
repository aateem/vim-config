finish
if !has('nvim-0.5.0')
    finish
endif

lua << EOF

require'nvim-treesitter.configs'.setup {
  ensure_installed = "python",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,
  },
  -- ident = {
  --   enable = true,
  -- },
}

EOF
