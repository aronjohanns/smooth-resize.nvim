# smooth-resize.nvim

smooth-resize.nvim is a small Neovim plugin that enables smooth, continuous window resizing with the default window resizing mappings
Inspired by [vim-resize-mode](https://github.com/sedm0784/vim-resize-mode)

**Before smooth-resize.nvim (Notice repeated <kbd>Ctrl-W</kbd>)**

<kbd>Ctrl-W</kbd><kbd>+</kbd><kbd>Ctrl-W</kbd><kbd>+</kbd><kbd>Ctrl-W</kbd><kbd>+</kbd><kbd>Ctrl-W</kbd><kbd>+</kbd><kbd>Ctrl-W</kbd><kbd>+</kbd><kbd>Ctrl-W</kbd><kbd>></kbd><kbd>Ctrl-W</kbd><kbd>></kbd>

**With smooth-resize.nvim**

<kbd>Ctrl-W</kbd><kbd>+</kbd><kbd>+</kbd><kbd>+</kbd><kbd>+</kbd><kbd>+</kbd><kbd>></kbd><kbd>></kbd>

**Using with count works as well**

<kbd>5</kbd><kbd>Ctrl-W</kbd><kbd>+</kbd><kbd>+</kbd><kbd>+</kbd><kbd>+</kbd><kbd>+</kbd><kbd>></kbd><kbd>></kbd>

> [!NOTE]
> smooth-resize.nvim is intentionally minimal. It does not provide keyboard remapping options and relies on Neovim’s default window resizing mappings (`<C-w>>`, `<C-w><`, `<C-w>+`, `<C-w>-`).

Exit smooth resize by using any other nvim command that is not a resize command.

# Installation

## Lazy.nvim

```lua
{
    "aronjohanns/smooth-resize.nvim",
    opts = {}
}
```

## Configuration
No configuration is needed but in rare cases it's required to disable smooth resize for certain filetypes. For example the file explorer Oil.nvim does not play well with smooth resize, we can therefore ignore its filetype "oil" and smooth resize will fall back to nvim default behaviour.

```lua
-- Example configuration for better integration with Oil.nvim
{
    disabled_fts = { "oil" }
}
```
