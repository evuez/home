
"""
" Name: plain.vim
"""

hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='plain'
set t_Co=256

if &background ==# 'dark'
  let c_normal1 =      'guisp=NONE guifg=#F5F5F5 guibg=#1C1C1C ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'
  let c_normal2 =      'guisp=NONE guifg=#EBEBEB guibg=#1C1C1C ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'

  let c_reverse =      'guisp=NONE guifg=#1C1C1C guibg=#F5F5F5 ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'

  let c_accent1 =      'guisp=NONE guifg=#1C1C1C guibg=#FFFAE3 ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'
  let c_accent2 =      'guisp=NONE guifg=#1C1C1C guibg=#E9AFA3 ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'
  let c_accent3 =      'guisp=NONE guifg=#1C1C1C guibg=#2176FF ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'

  let c_extra1  =      'guisp=NONE guifg=#000000 guibg=#F5F5F5 ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'

  let c_normal_none =  'guisp=NONE guifg=#F5F5F5 guibg=NONE    ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'
  let c_none_reverse = 'guisp=NONE guifg=NONE    guibg=#F5F5F5 ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'
  let c_none_accent1 = 'guisp=NONE guifg=NONE    guibg=#E9AFA3 ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'
  let c_none_none =    'guisp=NONE guifg=NONE    guibg=NONE    ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'
else
  let c_normal1 =      'guisp=NONE guifg=#1C1C1C guibg=#F5F5F5 ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'
  let c_normal2 =      'guisp=NONE guifg=NONE guibg=NONE ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'

  let c_reverse =      'guisp=NONE guifg=#F5F5F5 guibg=#1C1C1C ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'

  let c_accent1 =      'guisp=NONE guifg=#1C1C1C guibg=#FFFAE3 ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'
  let c_accent2 =      'guisp=NONE guifg=#1C1C1C guibg=#E9AFA3 ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'
  let c_accent3 =      'guisp=NONE guifg=#1C1C1C guibg=#2176FF ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'

  let c_extra1  =      'guisp=NONE guifg=#F5F5F5 guibg=#000000 ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'

  let c_normal_none =  'guisp=NONE guifg=#1C1C1C guibg=NONE    ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'
  let c_none_reverse = 'guisp=NONE guifg=NONE    guibg=#1C1C1C ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'
  let c_none_accent1 = 'guisp=NONE guifg=NONE    guibg=#E9AFA3 ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'
  let c_none_none =    'guisp=NONE guifg=NONE    guibg=NONE    ctermfg=0 ctermbg=0 gui=NONE cterm=NONE'
endif


" misc

exec 'hi ColorColumn ' .      c_normal2
exec 'hi Conceal ' .          c_normal1
exec 'hi Cursor ' .           c_none_reverse
exec 'hi lCursor ' .          c_none_reverse
exec 'hi CursorIM ' .         c_reverse
exec 'hi CursorColumn ' .     c_normal2
exec 'hi CursorLine ' .       c_normal2
exec 'hi Directory ' .        c_normal_none
exec 'hi DiffAdd ' .          c_reverse
exec 'hi DiffChange ' .       c_reverse
exec 'hi DiffDelete ' .       c_reverse
exec 'hi DiffText ' .         c_reverse
exec 'hi EndOfBuffer ' .      c_normal1
exec 'hi ErrorMsg ' .         c_reverse
exec 'hi VertSplit ' .        c_reverse
exec 'hi Folded ' .           c_reverse
exec 'hi FoldColumn ' .       c_reverse
exec 'hi SignColumn ' .       c_reverse
exec 'hi IncSearch ' .        c_reverse
exec 'hi LineNr ' .           c_reverse
exec 'hi LineNrAbove ' .      c_reverse
exec 'hi LineNrBelow ' .      c_reverse
exec 'hi CursorLineNr ' .     c_extra1
exec 'hi MatchParen ' .       c_none_accent1
exec 'hi ModeMsg ' .          c_reverse
exec 'hi MoreMsg ' .          c_reverse
exec 'hi NonText ' .          c_reverse
exec 'hi Pmenu ' .            c_reverse
exec 'hi PmenuSel ' .         c_extra1
exec 'hi PmenuSbar ' .        c_reverse
exec 'hi PmenuThumb ' .       c_reverse
exec 'hi Question ' .         c_reverse
exec 'hi QuickFixLine ' .     c_reverse
exec 'hi Search ' .           c_reverse
exec 'hi SpecialKey ' .       c_reverse
exec 'hi SpellBad ' .         c_reverse
exec 'hi SpellCap ' .         c_reverse
exec 'hi SpellLocal ' .       c_reverse
exec 'hi SpellRare ' .        c_reverse
exec 'hi StatusLine ' .       c_reverse
exec 'hi StatusLineNC ' .     c_reverse
exec 'hi StatusLineTerm ' .   c_reverse
exec 'hi StatusLineTermNC ' . c_reverse
exec 'hi TabLine ' .          c_reverse
exec 'hi TabLineFill ' .      c_reverse
exec 'hi TabLineSel ' .       c_reverse
exec 'hi Terminal ' .         c_reverse
exec 'hi Title ' .            c_none_none
exec 'hi Visual ' .           c_accent3
exec 'hi VisualNOS ' .        c_reverse
exec 'hi WarningMsg ' .       c_reverse
exec 'hi WildMenu ' .         c_reverse

" major

exec 'hi Normal ' .     c_normal1
exec 'hi Comment ' .    c_accent1
exec 'hi Constant ' .   c_normal_none
exec 'hi Identifier ' . c_normal_none
exec 'hi Statement ' .  c_normal_none
exec 'hi PreProc ' .    c_normal_none
exec 'hi Type ' .       c_normal_none
exec 'hi Special ' .    c_normal_none
exec 'hi Underlined ' . c_normal_none
exec 'hi Ignore ' .     c_normal_none
exec 'hi Error ' .      c_accent2
exec 'hi Todo ' .       c_accent2

" minor

exec 'hi String ' .          c_normal_none
exec 'hi Character ' .      c_normal_none
exec 'hi Number ' .         c_normal_none
exec 'hi Boolean ' .        c_normal_none
exec 'hi Float ' .          c_normal_none
exec 'hi Function ' .       c_normal_none
exec 'hi Conditional ' .    c_normal_none
exec 'hi Repeat ' .         c_normal_none
exec 'hi Label ' .          c_normal_none
exec 'hi Operator ' .       c_normal_none
exec 'hi Keyword ' .        c_normal_none
exec 'hi Exception ' .      c_normal_none
exec 'hi Include ' .        c_normal_none
exec 'hi Define ' .         c_normal_none
exec 'hi Macro ' .          c_normal_none
exec 'hi PreCondit ' .      c_normal_none
exec 'hi StorageClass ' .   c_normal_none
exec 'hi Structure ' .      c_normal_none
exec 'hi Typedef ' .        c_normal_none
exec 'hi SpecialChar ' .    c_normal_none
exec 'hi Tag ' .            c_normal_none
exec 'hi Delimiter ' .      c_normal_none
exec 'hi SpecialComment ' . c_accent1
exec 'hi Debug ' .          c_accent1
