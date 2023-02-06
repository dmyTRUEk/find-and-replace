# Find and Replace
Vim plugin for easy find and replace.

This plugin provides bind (`F2` by default) for:
- changing word from Normal mode
- changing selected text from Visual mode

This plugin does exactly `:%s/\<WordBefore\>/WordAfter/g`,
but provides simple binds for most frequent use cases of it.


## Installation
Just enable it in your preferable plugin manager.

Using [vim-plug](https://github.com/junegunn/vim-plug):
```
Plug 'dmytruek/find-and-replace'
```

Using [packer](https://github.com/wbthomason/packer.nvim):
```
use 'dmytruek/find-and-replace'
```


## Configuration
### Change or disable keybinds:
If you don't like default keybinds, you can disable them:
```
let g:findandreplace_disable_remaps = 1
```

And set your own
(be sure not to map functions meant for visual mode to normal mode and vice versa):
```
nnoremap <F2> :FindAndReplaceN<CR>
xnoremap <F2> :<C-U>FindAndReplaceX<CR>
```


## Todo
- nothing for now, if you have some suggestions, feel free to [open issue](https://github.com/dmyTRUEk/find-and-replace/issues/new)

