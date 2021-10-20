"COLORSCHEME CONFIG ==================================================

"ColorScheme Description: :h gui-colors

set termguicolors
colorscheme marakai

let g:gruvbox_transparent_bg = 1
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_italic = 1

let g:sonokai_style = 'shusia'

"Update lightline color with colorscheme change
augroup LightLineColorscheme
  autocmd!
  autocmd ColorScheme * call s:colorscheme2lightline()
augroup END

function! s:colorscheme2lightline()
  if !exists('g:loaded_lightline')
    return
  endif
  try
    "Transparent Background
    if g:colors_name =~# 'morokai\|marakai\|gruvbox\|palenight\|edge\|codedark\|darcula\|onedark'
      hi Normal guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE ctermbg=NONE
      hi TabLineFill guibg=NONE ctermbg=NONE
      hi Directory guibg=NONE ctermbg=NONE
      call s:lightline_update()
    "Opaque Background
    elseif g:colors_name =~# 'sonokai\|everforest\|nord'
      call s:lightline_update()
    "Nightowl Background
    elseif g:colors_name =~# 'nightowl'
      hi Normal guibg=#011627 ctermbg=NONE
      call s:lightline_update()
    endif 
  catch
  endtry
endfunction

"Lightline Init Function
function! s:lightline_update()
      let g:lightline.colorscheme = substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '') 
      " call s:lightline_init()
      call lightline#init()
      call lightline#colorscheme()
      call lightline#update()
endfunction

"Colorscheme Tweaks for All Colorschemes
autocmd ColorScheme * highlight CursorLine guibg=NONE ctermbg=NONE | highlight SignColumn guibg=NONE ctermbg=NONE | highlight CursorLineNr guibg=NONE ctermbg=NONE | highlight StatusLine gui=bold | highlight StatusLineNC gui=italic 
