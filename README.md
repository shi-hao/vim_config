# vim_config  
  
3 main plugins to vim, neocomplete, cscope, ctags   
neocomplete: code complete  
cscope     : finding function reference  
ctags      : function variable

## 1. install  
it is very simple, first change the script install.sh permission.  
	chmod +x install.sh  
then run the script install.sh   
    ./install.sh  
  
## 2. troubleshooting  
### neocomplete  
neocomplete requires Vim 7.3.885+ compiled with if_lua. If :echo has("lua") returns 1, then you're done;   
  
  
### cscope  
cscope will find the data base file in curent dir, if not exists, it will lookup the father dir.  
if you want create the cscope data base file, please first switch to the code project's root dir,  
then open any file with vim, then press F9  
  
### ctags  
ctags will find the data base file in curent dir, if not exists, it will lookup the father dir.  
if you want create the ctags data base file, please first switch to the code project's root dir,  
then open any file with vim, then press F10  
