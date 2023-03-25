# Yabai and Skhd Config

This repository contains my standalone Yabai and Skhd configurations.

# Keyboard Shortcuts

## Changing Focus

<kbd>⌥ Option</kbd> + <kbd>hjkl</kbd>

## Change focus between external displays (left and right)

<kbd>⌥ Option</kbd> + <kbd>s</kbd>

<kbd>⌥ Option</kbd> + <kbd>g</kbd>

## Modifying the layout

### Rotate layout clockwise

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>r</kbd>

### Flip along y-axis

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>y</kbd>

### Flip along x-axis

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>x</kbd>

### Toggle window float

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>t</kbd>

## Modifying Window Size

### Maximize a window

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>m</kbd>

### Balance out tree of windows (resize to occupy same area)

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>e</kbd>

### Resize windows

<kbd>⌃ Control</kbd> + <kbd>⌘ Command</kbd> + <kbd>h</kbd>

<kbd>⌃ Control</kbd> + <kbd>⌘ Command</kbd> + <kbd>j</kbd>

<kbd>⌃ Control</kbd> + <kbd>⌘ Command</kbd> + <kbd>k</kbd>

<kbd>⌃ Control</kbd> + <kbd>⌘ Command</kbd> + <kbd>l</kbd>

## Moving Windows Around

### Swap windows

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>j</kbd>

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>k</kbd>

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>h</kbd>

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>l</kbd>

### Move window and split

<kbd>⌃ Control</kbd> + <kbd>⌥ Option</kbd> + <kbd>j</kbd>

<kbd>⌃ Control</kbd> + <kbd>⌥ Option</kbd> + <kbd>k</kbd>

<kbd>⌃ Control</kbd> + <kbd>⌥ Option</kbd> + <kbd>h</kbd>

<kbd>⌃ Control</kbd> + <kbd>⌥ Option</kbd> + <kbd>l</kbd>

### Move window to display left and right

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>s</kbd>

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>g</kbd>

### Move window to prev and next space

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>p</kbd>
<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>n</kbd>

### Move window to space

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>1</kbd>

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>2</kbd>

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>3</kbd>

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>4</kbd>

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>5</kbd>

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>6</kbd>

<kbd>⇧ Shift</kbd> + <kbd>⌥ Option</kbd> + <kbd>7</kbd>

## Starting/Stopping/Restarting Yabai

### stop/start/restart yabai

<kbd>⌃ Control</kbd> + <kbd>⌥ Option</kbd> + <kbd>q</kbd>

<kbd>⌃ Control</kbd> + <kbd>⌥ Option</kbd> + <kbd>s</kbd>

<kbd>⌃ Control</kbd> + <kbd>⌥ Option</kbd> + <kbd>r</kbd>

---

# TMUX keys:

## Basic:

### Create new session:

`tmux new -s NameOfTheSession`

### Detach session:

`tmux detach`

### Attach to existing session:

`tmux attach -t NameOfTheSession`

### List existing sessions:

`tmux ls`

## Custom Prefix

<kbd>⌃ Control</kbd> + <kbd>a</kbd>

## Within TMUX see all of the tmux sessions:

<kbd>⌃ Control</kbd> + <kbd>a</kbd> + <kbd>s</kbd>

## Split plane horizontally:

<kbd>⌃ Control</kbd> + <kbd>a</kbd> + <kbd>-</kbd>

## Split plane vertically:

<kbd>⌃ Control</kbd> + <kbd>a</kbd> + <kbd>|</kbd>

## Toggle maximize pane:

<kbd>⌃ Control</kbd> + <kbd>a</kbd> + <kbd>m</kbd>

## Toggle maximize pane:

<kbd>⌃ Control</kbd> + <kbd>a</kbd> + <kbd>m</kbd>

## Resize panes:

<kbd>⌃ Control</kbd> + <kbd>a</kbd> + direction (<kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd>)

## Create new window:

<kbd>⌃ Control</kbd> + <kbd>a</kbd> + <kbd>c</kbd>

## Switch windows:

<kbd>⌃ Control</kbd> + <kbd>a</kbd> + <kbd>0</kbd> (whatever number the window is)

## Rename window:

<kbd>⌃ Control</kbd> + <kbd>a</kbd> + <kbd>,</kbd>

## Install tmux plugins (which are listed in `tmux.conf` already)

<kbd>⌃ Control</kbd> + <kbd>a</kbd> + <kbd>I</kbd>

## Navigate through windows (with the `christoomey/vim-tmux-navigator`)

<kbd>⌃ Control</kbd> + direction (<kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd>)

## Scroll mode:

<kbd>⌃ Control</kbd> + <kbd>a</kbd> + <kbd>[</kbd>

- and then we can use <kbd>k</kbd> or <kbd>j</kbd>

- or we can use <kbd>⌃ Control</kbd> + <kbd>u</kbd> to go _UP_ half a page.
- or we can use <kbd>⌃ Control</kbd> + <kbd>d</kbd> to go _DOWN_ half a page.

- or we can use <kbd>⌃ Control</kbd> + <kbd>b</kbd> to go _UP_ a full page.
- or we can use <kbd>⌃ Control</kbd> + <kbd>f</kbd> to go _DOWN_ a full page.

## Copy (when in scroll mode)

- we can select with <kbd>v</kbd> and use <kbd>y</kbd> to copy, just like in vim.

# nVIM custom keymaps and configs:

## Leader key:

<kbd>Space</kbd>

## Escape insert mode:

<kbd>j</kbd><kbd>k</kbd>

## Clear search highlights (in normal mode)

<kbd>Space</kbd> + <kbd>n</kbd><kbd>h</kbd>

## In Normal mode delete single char without keeping in clipboard

<kbd>x</kbd>

## Increment/decrement numbers:

<kbd>Space</kbd> + <kbd>=</kbd> (to increment)
<kbd>Space</kbd> + <kbd>-</kbd> (to decrement)

## Split, close window

### Split window horizontally

<kbd>Space</kbd> + <kbd>s</kbd><kbd>h</kbd>

### Split window vertically

<kbd>Space</kbd> + <kbd>s</kbd><kbd>v</kbd>

### Make split windows equal width

<kbd>Space</kbd> + <kbd>s</kbd><kbd>e</kbd>

### Close current split window

<kbd>Space</kbd> + <kbd>s</kbd><kbd>x</kbd>

## Tabs

### Open new tab

<kbd>Space</kbd> + <kbd>t</kbd><kbd>o</kbd>

### Close current tab

<kbd>Space</kbd> + <kbd>t</kbd><kbd>x</kbd>

### Go to next tab

<kbd>Space</kbd> + <kbd>t</kbd><kbd>n</kbd>

### Go to previous tab

<kbd>Space</kbd> + <kbd>t</kbd><kbd>p</kbd>

## Comment with `gc` (`numToStr/Comment.nvim` plugin)

### NORMAL mode

- `gcc` - Toggles the current line using linewise comment
- `gbc` - Toggles the current line using blockwise comment
- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment

### VISUAL mode

- `gc` - Toggles the region using linewise comment
- `gb` - Toggles the region using blockwise comment

## `vim-maximizer`

- In normal mode:

<kbd>space</kbd> + <kbd>s</kbd><kbd>m</kbd>

## nVim Tree (explorer)

<kbd>space</kbd> + <kbd>e</kbd>

## Telescope (fuzzy finder like):

### Find files within current working dir

<kbd>space</kbd> + <kbd>f</kbd><kbd>f</kbd>

### Find string within current working dir

<kbd>space</kbd> + <kbd>f</kbd><kbd>s</kbd>

### Find string under cursor in current working dir

<kbd>space</kbd> + <kbd>f</kbd><kbd>c</kbd>

### List open buffers in current nvim instance

<kbd>space</kbd> + <kbd>f</kbd><kbd>b</kbd>

### List available help tags

<kbd>space</kbd> + <kbd>f</kbd><kbd>h</kbd>

## nvim_comp (completion snippets)

### Next or previous suggestion:

<kbd>⌃ Control</kbd> + <kbd>j</kbd> or <kbd>k</kbd>

### Scroll docs:

<kbd>⌃ control</kbd> + <kbd>b</kbd> or <kbd>f</kbd>

### Show completion suggestions:

<kbd>⌃ Control</kbd> + <kbd>space</kbd>

### Close completion suggestions:

<kbd>⌃ Control</kbd> + <kbd>e</kbd>

## LSP

### Show definition

<kbd>g</kbd><kbd>f</kbd>

### Go to declaration

<kbd>g</kbd><kbd>D</kbd>

### See definition and make edits in window

<kbd>g</kbd><kbd>d</kbd>

### Go to implementation

<kbd>g</kbd><kbd>i</kbd>

### See available code actions

<kbd>space</kbd> + <kbd>c</kbd><kbd>a</kbd>

### Smart rename

<kbd>space</kbd> + <kbd>r</kbd><kbd>n</kbd>

### Show diagnostics for line

<kbd>space</kbd> + <kbd>D</kbd>

### Show diagnostics for cursor

<kbd>space</kbd> + <kbd>d</kbd>

### Jump to previous diagnostic in bugger

<kbd>[</kbd><kbd>d</kbd>

### Jump to next diagnostic in bugger

<kbd>]</kbd><kbd>d</kbd>

### Show documentation for what is under curor

<kbd>K</kbd>

### See outline in right hand side

<kbd>space</kbd> + <kbd>o</kbd>
