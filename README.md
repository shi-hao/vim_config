# vim_config  
  
This project will help you install the vim and 3 main vim plugins.
3 main plugins to vim:neocomplete, cscope, ctags

neocomplete : code completion    
cscope/ctags: function, variable reference

## 1. install  
it is very simple, first change the script install.sh permission.  

	chmod +x install.sh  

then run the script install.sh   

    ./install.sh  
  
## 2. troubleshooting  
### neocomplete  
neocomplete requires Vim 7.3.885+ compiled with if_lua. If :echo has("lua") returns 1, then you're done;   
here is the neocomplete github link: https://github.com/Shougo/neocomplete.vim/tree/ver.2.1  
  
  
### cscope  
cscope will find the data base file in curent dir, if not exists, it will lookup the father dir.  
if you want create the cscope data base file, please first switch to the code project's root dir,  
then open any file with vim, then press F9  
  
### ctags  
ctags will find the data base file in curent dir, if not exists, it will lookup the father dir.  
if you want create the ctags data base file, please first switch to the code project's root dir,  
then open any file with vim, then press F10  

## 3. test  
ubuntu16-lts, ubuntu18-lts

## 4.contact me

e-mail : shi7631470@163.com
   
web    ：www.shihao10.com
 
zhihu  ：https://zhuanlan.zhihu.com/c_86372362
    
wetchat：shi706734862
	 
<img src="https://github.com/shi-hao/c_language_study/blob/master/chatME.jpg" width="250" height="400" />
