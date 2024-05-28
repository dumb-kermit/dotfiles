  nnoremap <A-LeftMouse> <Cmd>
    \ set mouse=<Bar>
    \ echo 'mouse OFF until next cursor-move'<Bar>
    \ autocmd CursorMoved * ++once set mouse&<Bar>
    \ echo 'mouse ON'<CR>
