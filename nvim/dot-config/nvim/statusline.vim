highlight StatusLine guifg=#909aaf guibg=#242832
highlight StatusLineNC guifg=#606a7f guibg=#14161a gui=none cterm=none

augroup Statusline
	autocmd!
	autocmd FileType * setlocal statusline=%!DefaultStatusline()
	autocmd FileType help setlocal statusline=%!HelpStatusline()
	autocmd FileType nerdtree setlocal statusline=\ \ %{&filetype}
	autocmd FileType startify setlocal statusline=\ 契%{&filetype}
	autocmd FileType vim-plug setlocal statusline=\ \ %{&filetype}
augroup END

function! DefaultStatusline()
	let statusline = " ⚫%f %{Modifiable()}"
	let statusline .= "%{Modified()}"
	let statusline .= "%{Git()}"
	let statusline .= "%="
	let statusline .= "%{Linter()}"
	let statusline .= "%{Longlines()}"
	let statusline .= "%l,%c | %p%% %{Filetype()}"
	return statusline
endfunction

function! HelpStatusline()
	return "  %{&filetype} | %f%=%l,%c | %p%% "
endfunction

function! Modifiable()
	return &modifiable ? "" : " "
endfunctio

function! Modified()
	return &modified ? "|  modified " : ""
endfunction

function! Filetype()
	return &filetype == "" ? "| - " : "| ".&filetype." "
endfunction

function! Git()
	let branch = fugitive#head()
	return branch == "" ? "" : "|  ".branch.""
endfunction

function! Longlines()
	let thresold = &textwidth ? &textwidth : 80
	let spaces = repeat(" ", &ts)
	let long_lines = []
	let i = 0
	while i <= line("$")
		let len = strlen(substitute(getline(i), "\t", spaces, "g"))
		if len > thresold | call add(long_lines, i) | endif
		let i += 1
	endwhile
	if len(long_lines) > 0
		return printf(" %d (ln %d) | ", len(long_lines), min(long_lines))
	else
		return ""
	endif
endfunction

function! Linter()
	let counts = ale#statusline#Count(bufnr(""))
	if counts.total <= 0 | return "" | endif
	let error_count = counts.error + counts.style_error
	let warning_count = counts.total - error_count
	let error_string = error_count <= 0 ? '' : "﯇ " . error_count
	let warning_string = warning_count <= 0 ? '' : "喝" . warning_count
	let delimiter = warning_count > 0 && error_count > 0 ? " " : ""
	return warning_string . delimiter . error_string . " | "
endfunction
