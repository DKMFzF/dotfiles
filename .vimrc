" Основные настройки
set number              " Нумерация строк
" set relativenumber      " Относительная нумерация (опционально)
set cursorline          " Подсветка текущей строки
set tabstop=4           " 1 таб = 4 пробела
set shiftwidth=4        " Автоотступ = 4 пробела
set expandtab           " Заменять табы на пробелы
set autoindent          " Автоотступы
set smartindent         " Умные отступы
syntax on               " Включить подсветку синтаксиса
filetype plugin on      " Автодетект типов файлов

" === Поиск ===
set hlsearch            " Подсвечивать найденное
set incsearch           " Поиск по мере ввода
set ignorecase          " Игнорировать регистр
set smartcase           " Учитывать регистр, если есть заглавные

" === Цветовая схема ===
colorscheme desert " Встроенная схема (можно заменить на другую)

" Установка плагинов
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'       " Файловый менеджер
Plug 'vim-airline/vim-airline'   " Статусная строка
Plug 'vim-airline/vim-airline-themes'  " Темы для статусной строки
Plug 'ycm-core/YouCompleteMe'   " Автодополнение (опционально, сложный в установке)
Plug 'sheerun/vim-polyglot'     " Улучшенная подсветка синтаксиса для многих языков
Plug 'airblade/vim-gitgutter'   " Показывает изменения из Git
Plug 'jiangmiao/auto-pairs'     " Автозакрытие скобок
Plug 'preservim/nerdcommenter'  " Комментрии кода
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Поддрежка LSP
Plug 'pangloss/vim-javascript'                  " Поддержка JavaScript
Plug 'maxmellon/vim-jsx-pretty'                 " Поддержка JSX
Plug 'leafgarland/typescript-vim'               " Поддержка TypeScript
Plug 'peitalin/vim-jsx-typescript'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" Настройка плагинов

" Настройки coc.nvim
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Использовать TAB для автодополнения
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Использовать <CR> для подтверждения автодополнения
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" NERDTree (открывается по Ctrl+n)
nnoremap <C-n> :NERDTreeToggle<CR>

" Airline (статусная строка)
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1

" Включить подсветку синтаксиса для редких языков
let g:polyglot_disabled = ['markdown']  " Исключить markdown, если не нужен

" Кастомизация
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
highlight VertSplit guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE
