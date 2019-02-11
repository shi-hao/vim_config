# vim_config  
  
install 3 main plugins to vim: neocomplete, cscope, ctags  
  
# Troubleshooting  
## neocomplete  
neocomplete requires Vim 7.3.885+ compiled with if_lua. If :echo has("lua") returns 1, then you're done;   
  
  
## cscope  
cscope will find the data base file in curent dir, if not exists, it will lookup the father dir.  
if you want create the cscope data base file, please first switch to the code project's root dir,  
then open any file with vim, then press F9  
  
## ctags  
ctags will find the data base file in curent dir, if not exists, it will lookup the father dir.  
if you want create the ctags data base file, please first switch to the code project's root dir,  
then open any file with vim, then press F10  
