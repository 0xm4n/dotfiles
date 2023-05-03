vim.cmd [[

if has("cscope")

	" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
	set cscopetag

	" check cscope for definition of a symbol before checking ctags: set to 1
	" if you want the reverse search order.
	set csto=0

	" add any cscope database in current directory
	if filereadable("cscope.out")
		cs add cscope.out  
		" else add the database pointed to by environment variable 
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
		endif

		" show msg when any other cscope db added
		" set cscopeverbose
		set nocscopeverbose

		nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
		nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
		nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

		nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
		nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
		nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	

		nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
		nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
		nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

		endif

		set tags=./tags,tags;$HOME

		]]
