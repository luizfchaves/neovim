*myhelp.md* {this is my help file}

This is my help file.
# Summary: 
How to walk:
1. Point the cursor to the title that you want to know and press <vi'//n>
2. Press [[ or ]] to navigate between sections

---

|0 Summary
'|1 Motion reminder'
  '|1.1 split-windows'
  '|1.2 tabs'
  '|1.3 terminal'
  '|1.4 Definitions'
'|2 LazyGit'
'|3 Harpoon'
'|10 AI'

---
# |1 Motion reminder
    |1.1 split-windows
    [Ctrl+W (hjkl)] to move
    [Ctrl+W t] to move the selected window to another tab

    |1.2 tabs
    gt or gT to move
    :tabnew to create
    :tabclose to close

    |1.3 terminal
    <leader>t to open terminal options
    OBS: To exit fast: [<esc><esc><space>tc]

    :terminal to open a terminal
    [<leader>ts] To open a terminal already configured 
    [<leader>tc] Close the terminal
  
        |1.3.1 Terminal mode
        [i] to go terminal mode
        [esc esc] to exit terminal mode

    |1.4 Definitions
    [gd] to go to definition
    [C-o] to go back

---
# |2 LazyGit
:LazyGit to open LazyGit
To close: esc esc to exit Terminal mode and :q
The rest its really intuitive (if not, eventually i will add here) 


---
# |3 Harpoon
[<leader>h] To open Harpoon options
[Shift+j] or [J] to go to previous harpoon file
[Shift+k] or [K] to go to next harpoon file

---
# |10 AI
[<leader>ai] to open AI options
tab to accept the suggestion
