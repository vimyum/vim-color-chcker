let s:target="ctermbg"
command! -nargs=0 ColorChecker :call <sid>VidemColor()

function! s:VidemColor()
	map q :q!<CR>
	map <space> :call ColorToggle()<CR>:<BS>
	set nosmartindent
	set noautoindent
	call s:VidemColorShow()
endfunction

function! s:VidemColorShow()
	exe "%delete"
	exe "normal i-- <Space> Toggle Fore/Back, <q> Quit --"
	for i in range(0,255)
		if i < 10
			exec "syn match hi". s:target . i ." /  ". i ." /"
		elseif i < 100
			exec "syn match hi". s:target . i ." / ". i ." /"
		else
			exec "syn match hi". s:target . i ." / ". i ."/"
		endif
		exec "hi hi". s:target. i ." ". s:target . "=". i 
	endfor
	for i in range(1,255)
		if i < 10
			exec "norm A  ". i ." "
		elseif i < 100
			exec "norm A ". i ." "
		else
			exec "norm A ". i 
		endif
		if (i % 10) == 0
		exec "norm A\n"
		endif
	endfor
	exec "norm A  0 "
	exec "norm gg"
endfunction

function ColorToggle()
	if s:target == "ctermfg"
		let s:target = "ctermbg"
	else
		let s:target = "ctermfg"
	endif
	echo s:target
	call s:VidemColorShow()
endfunction

