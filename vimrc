""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim config by shi706734862@163.com start
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"neocomplete setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"pratical setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on			"语法高亮
syntax enable

set relativenumber	"显示行号    
set showcmd			"显示输入的命令

set ruler			"打开状态栏标尺
set magic			"设置魔术

set autoindent		"自动缩进
set cindent

set showmatch		"高亮显示匹配的括号
set smartindent		"为C程序提供自动缩进
set tabstop=4		"Tab键的宽度

"设置当前行，列高亮显示
"set cursorcolumn
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"set cursorline
"highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

"启用回车删除
set backspace=indent,eol,start  

"搜索字符高亮
set hlsearch
set incsearch

"统一缩进为4
set softtabstop=4
set shiftwidth=4

"设置中文编码，解决中文乱码 
set fencs=utf-8,GB18030,ucs-bom,default,latin1   

"自动增加注释，打开vim，按F4键
function AddTitle()
	call setline(1,"#!/bin/bash")
	call append(1,"#====================================================")
	call append(2,"# Author: shi")
	call append(3,"# Create Date: " . strftime("%Y-%m-%d"))
	call append(4,"# Description: ")
	call append(5,"#====================================================")
endf
"F4快捷键
map <F4> :call AddTitle()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline config 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2      "总是显示状态栏

"-- INSERT -- is unnecessary anymore because the mode information is displayed in the statusline
set noshowmode

"自定义status line
"highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
"文件名、路径、行号，总字符数，百分比、ascii码值、16进制值、文件编码格式、用户名、主机名
"set statusline=[%n]\ %f%m%r%h\ \|\ \ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ \


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope config 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"递归查找设置,如果本目录下没有cscope文件，则递归到上一级父目录查找
if has("cscope")
set csprg=/usr/bin/cscope
set csto=1
set cst
set nocsverb
	if filereadable("cscope.out")
		cs add cscope.out
	else
		let cscope_file=findfile("cscope.out", ".;")  
		let cscope_pre=matchstr(cscope_file, ".*/")  
		if !empty(cscope_file) && filereadable(cscope_file)  
			exe "cs add" cscope_file cscope_pre  
		endif
	endif
set csverb
endif

"按键重定义
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> 
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> 
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> 
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR> 
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"更新cscope
function! UpdateCscope()
	if filereadable("cscope.out")
		let cmd_del = 'rm -f cscope.out'
		let resp_cscope = system(cmd_del)

		let cmd_cscope = 'find . -name "*.h" -o -name "*.c" -o -name "*.cpp" > cscope.files'
		let resp_cscope = system(cmd_cscope)

		let cmd_cscope = 'cscope -Rbkq -i cscope.files'
		let resp_cscope = system(cmd_cscope)
	
		set nocsverb "关闭cscope提示
		cs reset     "重启cscope连接
		set csverb   "打开cscope提示
	endif
endfunction

"cscope add
function! CscopeAdd()
	let cmd_del = 'rm -f cscope.out'
	let resp_cscope = system(cmd_del)

	let cmd_cscope = 'find . -name "*.h" -o -name "*.c" -o -name "*.cpp" > cscope.files'
	let resp_cscope = system(cmd_cscope)

	let cmd_cscope = 'cscope -Rbkq -i cscope.files'
	let resp_cscope = system(cmd_cscope)

	set nocsverb          "关闭cscope提示
	cs add cscope.out
	cs reset              "重启cscope连接
	set csverb            "打开cscope提示
endfunction

"按f9生成并增加cscope文件
nmap <f9> :call CscopeAdd() <CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags config 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"递归查找设置,如果本目录下没有tags文件，则递归到上一级父目录查找
set tags=tags;
set autochdir

"更新ctags
function! DelTagOfFile(file)
	if filereadable("tags")
		let fullpath = a:file
		let cwd = getcwd()
		let tagfilename = cwd . "/tags"
		let f = substitute(fullpath, cwd . "/", "", "")
		let f = escape(f, './')
		let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
		let resp = system(cmd)
	endif
endfunction

function! UpdateTags()
	let cmd = 'ctags -R  --c++-kinds=+p --fields=+iaS --extra=+q'
	let resp = system(cmd)
endfunction

"按f8生成并增加ctags文件
nmap <f8> :call UpdateTags() <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim config by shi706734862@163.com end
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
