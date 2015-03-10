" Code (l)ine text object

" First non-whitespace to end of line excluding EOL ()
vnoremap il :<C-U>silent! normal! ^v$h<CR>
omap il :normal val<CR>

" First non-whitespace to end of line excluding EOL
vnoremap al :<C-U>silent! normal! ^v$h<CR>
omap al :normal val<CR>
nmap dal ^v$hd"_dd
