execute pathogen#infect()

autocmd BufNewFile,BufReadPost mutt*,.followup,COMMIT_EDITMSG,*.md set textwidth=78
autocmd BufNewFile,BufReadPost mutt*,.followup,COMMIT_EDITMSG,*.md set spell

filetype indent on
filetype on
filetype plugin on
let mapleader="\<Space>"
set hidden
set incsearch
set linebreak
set showbreak=»
set viminfo='20,\"500
set wildchar=<Tab> wildmenu wildmode=full
set nocompatible
set autoindent
set background=dark
set backspace=2
"set completeopt= 
set directory=~/.vim/tmp,C:\tmp
set expandtab
set guioptions-=T
set hlsearch
set laststatus=2
set noea
set nowrap
set ofu=syntaxcomplete#Complete
set ruler
set scrolloff=10
set shiftwidth=2
set softtabstop=2
set mouse=a
set suffixesadd=.coffee,.js,.jsx

set tabstop=4
set title
set wildignore=*.swp,*.bak,*.pyc,*.class,bin,obj

call pathogen#infect()
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

fu! One()
  return ""
endfu

fu! StatusLine()
    "%#errormsg#%{&ff!="unix"?"[".&ff."]":""}%*%#errormsg#%{(&fenc!="utf-8"&&&fenc!="")?"[".&fenc."]":""}%*
    let status_buf = '%#Filename#%f%*%m%r%w%y%{fugitive#statusline()}%#errormsg#%{&ff!="unix"?"[".&ff."]":""}%*%#errormsg#%{One()}%{(&fenc!="utf-8"&&&fenc!="")?"[".&fenc."]":""}%*%=%#errormsg#%{SyntasticStatuslineFlag()}%-40.(%#VimFold#[%p%%][%l,%v])'
    return status_buf
endfu
set statusline=%!StatusLine()

au BufEnter *            hi statusline   guibg=#FF6600 guifg=black
au BufEnter *.html       hi statusline   guibg=#B2EC00 guifg=black
au BufEnter *.cshtml     hi statusline   guibg=#B2EC00 guifg=gray10
au BufEnter *.handlebars hi statusline   guibg=#F15A24 guifg=gray10
au BufEnter *.css        hi statusline   guibg=#FF0097 guifg=gray10
au BufEnter *.js         hi statusline   guibg=#0097FF guifg=gray10
au BufEnter *.coffee     hi statusline   guibg=#502f00 guifg=gray90
au BufEnter *.py         hi statusline   guibg=#66FF00 guifg=gray10
au BufEnter *            hi statuslineNC guibg=gray30  guifg=black

au BufEnter *.html       imap </ </<C-X><C-O>
au BufLeave *.html       imap </ </
au BufEnter *.xml        imap </ </<C-X><C-O>
au BufLeave *.xml        imap </ </
au BufEnter *.xslt       imap </ </<C-X><C-O>
au BufLeave *.xslt       imap </ </
au BufEnter *.cshtml     imap </ </<C-X><C-O>
au BufLeave *.cshtml     imap </ </
au BufEnter *.handlebars imap </ </<C-X><C-O>
au BufLeave *.handlebars imap </ </
au BufEnter *.js imap </ </<C-X><C-O>
au BufLeave *.js imap </ </

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=utf-8,latin1
endif

if has("fuoptions")
    set fuoptions=maxvert,maxhorz
    set guifont="Source Code Pro"
elseif has("win16") || has("win32") || has("win64")
    set guifont=DejaVu_Sans_Mono:h9:cANSI
    " set guifont="Source_Code_Pro:h9"
endif

let g:syntastic_enable_balloons=1
let g:syntastic_enable_highlighting = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_stl_format="%E{%e✗}%B{ }%W{%w⚠}"

let g:fsharp_only_check_errors_on_write=1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = "--rulesdir ~/repos/Infrastructure/web-client/eslint_rules/"
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_coffee_checkers = ['coffeelint', 'coffee']
let g:syntastic_coffee_coffeelint_args = "--csv --file /Users/lorcan/repos/ServiceFrame/tools/coffeelint-diff/coffeelint-config.json"
" let g:syntastic_haskell_checkers = [ 'hdevtools', 'ghc_mod', 'hlint', 'scan' ]
let g:syntastic_haskell_checkers = [ 'hlint', 'scan' ]
" let g:syntastic_haskell_checkers = [ 'ghc_mod', 'hlint', 'scan' ]
let g:syntastic_yaml_checkers = [ 'js-yaml' ]
let g:syntastic_less_checkers = [ 'lessc' ]
let g:syntastic_json_checkers = [ 'jsonlint' ]
let g:syntastic_python_checkers = [ 'flake8', 'python', 'pylint' ]
let g:syntastic_erlang_checkers = [ 'escript', 'syntaxerl' ]
let g:syntastic_Dockerfile_checkers = [ 'dockerfile_lint' ]
" let g:syntastic_haskell_checkers = [ 'hdevtools', 'hlint', 'scan' ]
let g:syntastic_haskell_scan_args = "-t"
" let g:syntastic_haskell_hlint_args = "--hint=Default --hint=Dollar --hint=Generalise"
let g:syntastic_sh_checkers = [ 'bashate', 'sh', 'shellcheck' ]
let g:syntastic_sh_shellcheck_args = "-x"
let g:syntastic_yaml_checkers = [ 'yamllint', 'jsyaml' ]

let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']

function! GetHTML()
python3 << EOF
import vim, BeautifulSoup, urllib
handle = urllib.urlopen(vim.current.line)
soup = BeautifulSoup.BeautifulSoup(handle.read())
vim.current.buffer[:] = handle.read() #soup.prettify().split('\n')
EOF
endfunction

fu! DoDumpTextToCouch()
    sil %!"bash /home/ieu71762/scripts/bin/dumpTextToCouch.sh"
endfu

fu! FindInSF(search_term)
      :execute ":Ggrep \"" . a:search_term . "\" "
endfu

" fu! ExtractFunc(name) range
"   :execute "dmaGpo" . a:name ." = () -><ESC>.ao" . a:name . "()<ESC>"
" endfu

fu! CatSnippet()
    if has("win16") || has("win32") || has("win64")
        sil %!"cat C:\Users\LorcanMcDonald\.vim\snippets\template.html"
    else
        sil %read ~/.vim/snippets/template.html
    endif
    setlocal ft=html
endfu

fu! ReactSnippet()

    if has("win16") || has("win32") || has("win64")
        sil %!"cat C:\cygwin\home\ieu71762\.vim\snippets\template.dojo.js"
    else
        sil %read ~/.vim/snippets/template.react.js
    endif
    setlocal ft=javascript
endfu

fu! DojoSnippet()

    if has("win16") || has("win32") || has("win64")
        sil %!"cat C:\cygwin\home\ieu71762\.vim\snippets\template.dojo.js"
    else
        sil %!"cat ~/.vim/snippets/template.dojo.js"
    endif
    setlocal ft=javascript
endfu
command! RunCatSnippet call CatSnippet()
command! RunReactSnippet call ReactSnippet()
command! DumpToCouch call DoDumpTextToCouch()

command! -nargs=+ -complete=shellcmd RunPreview call DoRunPreview("<args>")
command! -nargs=+ Search call FindInSF("<args>")
" command! -nargs=+ Extract call ExtractFunc("<args>")
map \\ :Search 
map \* :Search <C-R>=expand('<cword>')<CR><CR>
map §§ :Search 
map §* :Search <C-R>=expand('<cword>')<CR><CR>

fu! DoRunPreview(cmd)
    pclose!

    " copy the buffer into a new window, then run that buffer through the command
    redir @b
    echo "sil %y a | below new | sil put a | sil %!" . a:cmd
    "set sb| split ". a:cmd . "_OUTPUT | set nosb| sil put a | sil %!" . a:cmd

    redir END
    @b
    " indicate the output window as the current previewwindow
    setlocal previewwindow ro nomodified wrap

    " back into the original window
    winc p
endfu

fu! OpenHTMLInChrome()
python3 << EOF
import vim
import re

contents = ''.join(vim.current.buffer[:])

escapedContents = re.sub(r'!', r'\!', contents)
escapedContents = re.sub(r'"', r'\"', escapedContents)
commandLine = "sil ! open -a \"Google Chrome\" --args 'data:text/html,%s'" % escapedContents
vim.command(commandLine)

EOF

endfu

nmap <Leader>uu :read !wordy-uuid<CR>

nmap <Leader>p :set paste!<CR>:set paste?<CR>

"Run as
nmap <Leader>rp   :set ft=python<CR>:RunPreview python<CR>
nmap <Leader>rc   :set ft=coffee<CR>:RunPreview sugar<CR>
nmap <Leader>rh   :set ft=haskell<CR>:RunPreview runhaskell<CR>
nmap <Leader>rj   :set ft=javascript<CR>:RunPreview node<CR>
nmap <Leader>rdj  :set ft=javascript<CR>:RunPreview bash ~/scripts/js/vimDojoJS.sh<CR>
nmap <Leader>rjsl :set ft=javascript<CR>:RunPreview bash ~/scripts/js/vimJSLint.sh<CR>
nmap <Leader>rs   :set ft=scheme<CR>:RunPreview scheme --quiet<CR>
nmap <Leader>rr   :call RunFile()<CR>

map <Leader>dc :DumpToCouch<CR>

function! ImportHoogle()
  " get word under cursor into i register
  normal "iyiw
  " save current position I mark
  normal mI
  " Jump to import statements
  execute "normal! gg/import\<cr>"
  execute "normal! gg/^$\<cr>"
  normal k

  " Insert the result from Hoogle
  execute "r !set +e; hoogle " . @I . "| head -1 | awk '{print \"import \"$1\" (\"$2\")\"}'"
  call FormatCode()
  normal 'I
endfu

nmap <Leader>i :call ImportHoogle()<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" Evaluate and replace a vim expression
map <Leader>ee c$<C-R>=<C-R>"<CR>
vmap <Leader>e c<C-R>=<C-R>"<CR>

"\f - Format commands
fu! FormatCode()
python3 << EOF
import vim
filetype = vim.eval('&filetype')
formatCommands = { ''           :  ':Neoformat'
                 , 'haskell'    :  ':Neoformat'
                 , 'rust'       :  ':Neoformat'
                 , 'c'          :  ':%!clang-format'
                 , 'cpp'        :  ':%!clang-format'
                 , 'javascript' :  ':Neoformat'
                 , 'typescript' :  ':Neoformat'
                 }
try:
    command = formatCommands[filetype]
except:
    command = formatCommands['']

vim.command(command)

EOF
endfu

augroup fmt
  autocmd!
  " autocmd BufWritePre *.js Neoformat prettier
  " autocmd BufWritePre *.jsx Neoformat prettier
  autocmd BufWritePre *.hs Neoformat
  autocmd BufWritePre *.c Neoformat
  autocmd BufWritePre *.h Neoformat
augroup END

autocmd bufwrite *.rs silent call FormatCode()
" autocmd bufwrite *.hs silent call FormatCode()
" autocmd bufwrite *.c silent call FormatCode()
" autocmd bufwrite *.h silent call FormatCode()
autocmd bufwrite *.js silent call FormatCode()
autocmd bufwrite *.hs silent call FormatCode()
autocmd bufwrite *.c silent call FormatCode()
autocmd bufwrite *.h silent call FormatCode()

"Format an xml doc
vmap <Leader>/ :Tabularize /
"Flatten an indented file
map <Leader>ff :call FormatCode()<CR>
"Reindent a whole file
map <Leader>f= ggVG=
map <Leader>fh :setlocal ft=xhtml<CR>:%!xmllint --format --html --xmlout -<CR>ggdd
"For XHTML we remove first line as xmllint adds an XML head tag
map <Leader>fx :setlocal ft=xml<CR>:%!xmllint --format -<CR>
"map <Leader>fj :setlocal ft=python<CR>:%!python -m json.tool<CR>
map <Leader>fj :setlocal ft=javascript<CR>:%!omnipretty<CR>
map <Leader>fp :%!omnipretty<CR>

vmap <Leader>ss :sort<CR>

map <Leader>s{ vi}:s/,*$/,/<CR>vi}:sort<CR>/}<CR>?,<CR>x
map <Leader>s} vi}:s/,*$/,/<CR>vi}:sort<CR>/}<CR>?,<CR>x

map <A-C-Left> <<
map <A-C-Right> >>

imap <A-C-Left> <C-o><<
imap <A-C-Right> <C-o>>>

vmap <A-C-Left> <'[V']
vmap <A-C-Right> >'[V']

map <A-C-Up> ddkP
map <A-C-Down> ddp

imap <A-C-Up> <C-o>dd<C-o>k<C-o>P
imap <A-C-Down> <C-o>dd<C-o>p

vmap <A-C-Up> dkP'[V']
vmap <A-C-Down> dp'[V']

"Reindent selections
vmap <Leader>fx :!xmllint --format -<CR>
vmap <Leader>fh :!xmllint --format --html --xmlout -<CR>
vmap <Leader>fj :!omnipretty<CR>
vmap <Leader>fp :!omnipretty<CR>

"Unformat
vmap <Leader>ff :s/^\s\+//g<CR>:%s/\n//g<CR>

map <Leader>s{ vi{:sort<cr>

map <Leader>th :RunCatSnippet<CR>
map <Leader>tserif ifont-family: 'Century Schoolbook', Century, Garamond, serif<ESC>
map <Leader>tsans ifont-family: Helvetica, Arial, sans-serifi<ESC>
map <Leader>tr :RunReactSnippet<CR>
map <Leader>h :set list!<CR> 
set listchars=eol:␤,tab:␉▄,trail:⚈

"\w - Wrap commands
" \w<c> -- Wrap text in char
map   <Leader>wtry   itry{<CR><ESC>gpi<CR>}catch(e){<CR>console.error(e);<CR>}<CR><ESC>vi{=
map   <Leader>w{     i{<ESC>gpi}<ESC>
map   <Leader>w}     i{<ESC>gpi}<ESC>
map   <Leader>w/*    i/*<ESC>gpi*/<ESC>
map   <Leader>w*/    i/*<ESC>gpi*/<ESC>
map   <Leader>w(     i(<ESC>gpi)<ESC>
map   <Leader>w)     i(<ESC>gpi)<ESC>
map   <Leader>w[     i[<ESC>gpi]<ESC>
map   <Leader>w]     i[<ESC>gpi]<ESC>
map   <Leader>w"     i"<ESC>gpi"<ESC>
map   <Leader>w'     i'<ESC>gpi'<ESC>

let g:CommandTFileScanner="git"
map <Leader><Space> :CommandT<CR>
" let g:unite_source_history_yank_enable = 1
" " call unite#filters#matcher_default#use( ['matcher_default',
" 'matcher_hide_hidden_files', 'matcher_hide_current_file', 'matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_selecta'])
" map <Leader><Space> :Unite -buffer-name=files   -start-insert file_rec/async:!<CR>

" let g:unite_source_history_yank_enable=1
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <leader>, :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>

vmap <Leader>ta :py rangeToASCII()<CR>
vmap <Leader>tl :py rangeToHTMLList()<CR>
vmap <Leader>tt :py rangeToHTMLTable()<CR>

" Window Navigation
map <S-A-Down> :wincmd w<CR>
map <S-A-Up> :wincmd W<CR>
map <S-D-Down> :wincmd w<CR>
map <S-D-Up> :wincmd W<CR>

map <S-A-Left> :bn<CR>
map <S-A-Right> :bp<CR>

nmap <C-Tab> :tabn<CR>
nmap <C-S-Tab> :tabp<CR>

map <Leader>l :call LogLine()<CR>

command! -nargs=+ -complete=shellcmd RunInTmux call RunInTmux("<args>")
command! -nargs=+ -complete=shellcmd TestInTmux call TestInTmux("<args>")
map <Leader>w :RunInTmux 
map <Leader>ww :call RerunCode()<CR>
map <Leader>tt :call TestCode()<CR>

" nmap <Leader>py :%!copycloud<CR>u
" nmap <Leader>pp :read !pastecloud<CR>
" vmap <Leader>py :!copycloud<CR>u
" vmap <Leader>pp :!pastecloud<CR>

map   <C-A-Left>    :wincmd   h<CR>
map   <C-A-Right>   :wincmd   l<CR>
map   <S-D-Left>    :bn<CR>
map   <S-D-Right>   :bp<CR>

nmap   <S-Tab> <C-o>
nmap   <D-[> <C-o>
nmap   <D-]> <C-i>

map   <C-Tab>     :tabnext<CR>
map   <C-S-Tab>   :tabp<CR>

map <F3> :cn<CR>
map <F4> :cp<CR>

map <F5> ]c
map <F6> [c
map <F7> :diffget<CR>
map <F8> :diffthis<CR>:wincmd w<CR>:diffthis<CR>

au WinLeave * set nocursorcolumn
au WinEnter * set cursorcolumn

set number
set relativenumber

set undofile
set undodir=~/.vim/undo,C:\tmp

if has('python')

python3 <<EOF
sys.path.append('/home/lorcan/.vim/python')
sys.path.append('/Users/lorcan/.vim/python')

sys.path.append('/home/lorcan/scripts/py')
sys.path.append('/Users/lorcan/scripts/py')
EOF
endif

colorscheme desert
if &t_Co >= 256 || has("gui_running")
    colorscheme seoul256
endif

fu! RunInTmux(command)
python3 << EOF
import vim
from subprocess import call
command = vim.eval("a:command")
command = command + "\n"
call(["tmux", "send-keys", "-t", "1", command])
EOF

endfu

fu! RerunCode()
python3 << EOF
import vim
filetype = vim.eval('&filetype')
rerunCommands = { ''           :  'call RunInTmux(@%)'
                , 'c'          :  'call RunInTmux("make")'
                , 'c++'        :  'call RunInTmux("make")'
                , 'cabal'      :  'call RunInTmux("cabal build")'
                , 'coffee'     :  'call ReloadChrome()'
                , 'dot'        :  'call RunInTmux("dot -Tpng -O " . @% . " && open " . @% . ".png")'
                , 'elm'        :  'call ReloadChrome()'
<<<<<<< HEAD
||||||| merged common ancestors
                , 'dot'        :  'call RunInTmux("fdp -Tpng -O " . @% . " && open " . @% . ".png")'
=======
                , 'dot'        :  'call RunInTmux("dot -Tpng -O " . @% . " && open " . @% . ".png")'
>>>>>>> ce4734b0324cceceac113cec2a394c510196bb86
                , 'haskell'    :  'call RunInTmux("cabal build")'
                , 'html'       :  'call ReloadChrome()'
                , 'javascript' :  'call ReloadChrome()'
                , 'less'       :  'call ReloadChrome()'
                , 'make'       :  'call RunInTmux("make")'
                , 'python'     :  'call RunInTmux("python " . @%)'
                , 'rust'       :  'call RunInTmux("cargo build")'
                , 'sh'         :  'call RunInTmux(@%)'
<<<<<<< HEAD
                , 'stylus'     :  'call ReloadChrome()'
||||||| merged common ancestors
=======
                , 'markdown'   :  'call RunInTmux("pandoc -c ~/.vim/opt/pandoc.css -f markdown -t html -o " . @% . ".html " . @% . " && open " . @% . ".html")'
>>>>>>> ce4734b0324cceceac113cec2a394c510196bb86
                }
try:
    command = rerunCommands[filetype]
except:
    command = rerunCommands['']

vim.command(command)

EOF
endfu

fu! TestCode()
python3 << EOF
import vim
filetype = vim.eval('&filetype')
rerunCommands = { ''           :  'call RunInTmux(@%)'
                , 'javascript' :  'call RunInTmux("npm test")'
                , 'coffee'     :  'call RunInTmux("npm test")'
                , 'haskell'    :  'call RunInTmux("cabal test")'
                , 'cabal'      :  'call RunInTmux("cabal test")'
                }
try:
    command = rerunCommands[filetype]
except:
    command = rerunCommands['']

vim.command(command)

EOF
endfu

fu! ReloadChrome()
    if has('win32')
        :!start C:\Users\LorcanMcDonald\scripts\autohotkey\focus-reload-chrome.exe
    else
python3 << EOF
from subprocess import call
browser_command = """
tell application "Google Chrome" to tell the active tab of its first window
    reload
end tell
tell application "Google Chrome" to activate
"""

call(['osascript', '-e', browser_command])
EOF
    endif
endfu

fu! RunFile()
    let commands = { "python"     : "python",
                     "coffee"     : "sugar",
                     "haskell"    : "runhaskell",
                     "javascript" : "node",
                     "scheme"     : "scheme --quiet"
                     }

    if has_key(commands, &ft)
        let interpreter = commands[&ft]
        :execute ":RunPreview " . interpreter
    else
        :echo "No interpreter for " . &ft . " files"
    endif
endfu

fu! LogLine()
python3 << EOF

import vim
cssColors = [
    "F0F8FF", "FAEBD7", "00FFFF", "7FFFD4", "F0FFFF", "F5F5DC", "FFE4C4", "000000", "FFEBCD", "0000FF", "8A2BE2", "A52A2A", "DEB887", "5F9EA0", "7FFF00", "D2691E", "FF7F50", "6495ED", "FFF8DC", "DC143C",
    "00FFFF", "00008B", "008B8B", "B8860B", "A9A9A9", "A9A9A9", "006400", "BDB76B", "8B008B", "556B2F", "FF8C00", "9932CC", "8B0000", "E9967A", "8FBC8F", "483D8B", "2F4F4F", "2F4F4F", "00CED1", "9400D3",
    "FF1493", "00BFFF", "696969", "696969", "1E90FF", "B22222", "FFFAF0", "228B22", "FF00FF", "DCDCDC", "F8F8FF", "FFD700", "DAA520", "808080", "808080", "008000", "ADFF2F", "F0FFF0", "FF69B4", "CD5C5C",
    "4B0082", "FFFFF0", "F0E68C", "E6E6FA", "FFF0F5", "7CFC00", "FFFACD", "ADD8E6", "F08080", "E0FFFF", "FAFAD2", "D3D3D3", "D3D3D3", "90EE90", "FFB6C1", "FFA07A", "20B2AA", "87CEFA", "778899", "778899",
    "B0C4DE", "FFFFE0", "00FF00", "32CD32", "FAF0E6", "FF00FF", "800000", "66CDAA", "0000CD", "BA55D3", "9370DB", "3CB371", "7B68EE", "00FA9A", "48D1CC", "C71585", "191970", "F5FFFA", "FFE4E1", "FFE4B5",
    "FFDEAD", "000080", "FDF5E6", "808000", "6B8E23", "FFA500", "FF4500", "DA70D6", "EEE8AA", "98FB98", "AFEEEE", "DB7093", "FFEFD5", "FFDAB9", "CD853F", "FFC0CB", "DDA0DD", "B0E0E6", "800080", "FF0000",
    "BC8F8F", "4169E1", "8B4513", "FA8072", "F4A460", "2E8B57", "FFF5EE", "A0522D", "C0C0C0", "87CEEB", "6A5ACD", "708090", "708090", "FFFAFA", "00FF7F", "4682B4", "D2B48C", "008080", "D8BFD8", "FF6347",
    "40E0D0", "EE82EE", "F5DEB3", "FFFFFF", "F5F5F5", "FFFF00", "9ACD32" ]

def opposite(cssColor):
    # http://stackoverflow.com/questions/6372228/how-to-parse-a-list-or-string-into-chucks-of-fixed-length
    n = 2
    def toHex (i):
      hexVal = hex(255 - int(''.join(cssColor[i:i+n]), 16))[2:5]
      if len(hexVal) < 2:
        return '0' + hexVal
      else:
        return hexVal

    return ''.join([ toHex(i) for i in range(0, len(cssColor), n)])

loglines = { ''               : '%(indent)sprint(%(line)s)'
           , 'html'           : '%(indent)s{{debug "%(escapedLine)s" %(line)s}}'
           , 'javascript'     : '%(indent)sconsole.log("%(escapedLine)s", %(line)s);'
           , 'javascript.jsx' : '%(indent)sconsole.log("%(escapedLine)s", %(line)s);'
           , 'coffee'         : '%(indent)sconsole.log "%(escapedLine)s", %(line)s'
           , 'haskell'        : '%(indent)s(trace (show $ %(escapedLine)s) %(line)s)'
           , 'java'           : '%(indent)sSystem.out.println("%(escapedLine)s        : " + %(line)s)'
           , 'c'              : '%(indent)sprintf("%%s %%s", "%(escapedLine)s", %(line)s);'
           , 'c++'            : '%(indent)scout << "%(escapedLine)s                   : " << %(line)s'
           , 'python'         : '%(indent)sprint("%(escapedLine)s", %(line)s)'
           , 'sh'             : '%(indent)secho \'%(line)s\' %(line)s'
           , 'rust'           : '%(indent)sdebug!("%(line)s {}", %(line)s);'
           }

filetype = vim.eval('&filetype')
try:
    log_statement = loglines[filetype]
except:
    log_statement = loglines['']
import re
reg = re.compile(r'^(\s*)')
indent = reg.match(vim.current.line).group()
line = vim.current.line.strip()
escapedLine = re.sub(r'"', r'\"', line)
colorIndex = sum( [ord(c) for c in vim.current.buffer.name]) % len(cssColors)

vim.current.line = log_statement % {'escapedLine': escapedLine, 'line': line, 'indent': indent, 'color': cssColors[colorIndex], 'background': opposite(cssColors[colorIndex])}
EOF
endfu

let g:netrw_cygwin=1
let g:netrw_http_xcmd= "-dump >"
au BufReadPost *.hs   set keywordprg=hoogle

syntax on
"Catch trailing commas
:highlight Trailing ctermbg=cyan ctermfg=black guibg=cyan guifg=black
:highlight Filename ctermbg=gray ctermfg=white guibg=#5d686e guifg=white

" configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

call matchadd("Error", ",\\_s*[)}\\]]")
call matchadd("Trailing", "\\s\\s*$")
call matchadd("Trailing", "\\t")

:digr DA 9660 UA 9664 RA 9658 LA 9656 ** 9733 p> 9758

xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine
set tags=tags;/,codex.tags;/
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : '"coffeetags',
        \ 'ctagsargs' : '--include-vars',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif
if executable('lushtags')
    let g:tagbar_type_haskell = {
        \ 'ctagsbin' : 'lushtags',
        \ 'ctagsargs' : '--ignore-parse-error --',
        \ 'kinds' : [
            \ 'm:module:0',
            \ 'e:exports:1',
            \ 'i:imports:1',
            \ 't:declarations:0',
            \ 'd:declarations:1',
            \ 'n:declarations:1',
            \ 'f:functions:0',
            \ 'c:constructors:0'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 'd' : 'data',
            \ 'n' : 'newtype',
            \ 'c' : 'constructor',
            \ 't' : 'type'
        \ },
        \ 'scope2kind' : {
            \ 'data' : 'd',
            \ 'newtype' : 'n',
            \ 'constructor' : 'c',
            \ 'type' : 't'
        \ }
    \ }
endif
"au BufWritePost *.coffee !start cmd /c "node" C:\Users\LorcanMcDonald\repos\Ericsson-Airtel\tools\build-web\main.js
xmap <Leader>s <Plug>Vsurround

if filereadable('.vimrc.local')
  " If so, go ahead and load it.
  source .vimrc.local
endif

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

fu! CoffeeFoldLevel(line)
python3 <<EOF
import vim
import re
from random import randint

funcRE = re.compile(r'[-=]>')
indentRe = re.compile(r'^(\s*)')
blankLineRe = re.compile(r'^\s*$')
line = vim.eval("getline(a:line)")
if funcRE.search(line):
    level = ">%s" % (vim.eval('IndentLevel(a:line)'))
elif blankLineRe.match(line):
    level = '-1'
else:
    level = '='

cmd = 'let level = "%s"' % level
vim.command(cmd)
EOF
return level
endfu

command! OpenInFinder silent :!open %:p:h
command! OpenInGithub :call DoOpenInGithub(@%)

if $TMUX == ''
    set clipboard+=unnamed
endif

fu! DoOpenInGithub(filename)
python3 <<EOF
import os
import vim
f=vim.eval("a:filename")

relpath = os.path.relpath(f, '/Users/lorcan/repos/')
print relpath

EOF
endfu

" Source the vimrc file after saving it
if has("autocmd") && exists("g:AutoReloadVimrcInit")
    let g:AutoReloadVimrcInit=true
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd bufwritepost vimrc source $MYVIMRC
endif

nmap <Leader><Tab> :TagbarToggle<CR>

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

autocmd BufWritePost *.hs GhcModCheckAndLintAsync
autocmd BufEnter *.hs set formatprg=pointfree\ --stdin

set colorcolumn=80

" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

call plug#begin('~/.vim/plugged')
Plug 'sbdchd/neoformat'
Plug 'johngrib/vim-game-code-break'
call plug#end()
