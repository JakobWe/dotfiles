"find terminal colors with this:

" for colour in {1..255}
"     do echo -en "\033[38;5;${colour}m38;5;${colour} \n"
" done | column -x








:syn match logDate /"Gib.\{-}"/

":syn match logDate /^\d\{4}-\d\{2}-\d\{2}/ nextgroup=logTime skipwhite
hi def logDate ctermbg=green guibg=red ctermfg=black guifg=white

:syn match isinTag /<ISIN>.*<\/ISIN>/

hi def isinTag ctermbg=green guibg=green ctermfg=black guifg=white

:syn keyword sending Sending
hi def sending ctermbg=yellow ctermfg=black

:syn keyword receiving Receiving
hi def receiving ctermbg=yellow ctermfg=black




":syn match braces /\({\|}\)/
"hi def braces ctermbg=red ctermfg=black


":syn match metaData /\({\|}\)/
":syn match metaData /2.*}/
":syn match metaData /\d\{4}-\d\{2}-\d\{2}T\d\{2}:\d\{2}:\d\{2}\.\d\{6}+\d\{2}:\d\{2}/
:syn match metaData /^.\{-}\d\{2}:\d\{2}:\d\{2}/ containedin=ttt
hi def metaData ctermbg=94 ctermfg=16

"00:01:40,988
:syn match timeData /\d\{2}:\d\{2}:\d\{2}\,\d\{3}/ containedin=ttt
hi def timeData ctermbg=94 ctermfg=16




:syn match stackTrace /deployment.*)/
hi def stackTrace ctermbg=green


:syn keyword error ERROR
hi def error ctermbg=red

:syn match ttt /^.*}/
hi def ttt ctermbg=237
