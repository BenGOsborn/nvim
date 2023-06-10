function Theme() 
		vim.cmd.colorscheme("rose-pine")

		vim.cmd([[
			augroup ColorSchemeAutocmd
				autocmd!
				autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
			augroup END
		]])
end

Theme()
