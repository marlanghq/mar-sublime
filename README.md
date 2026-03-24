# Mar for Sublime Text

This package adds syntax highlighting, snippet completions, and LSP integration for `.mar` files.

## Included

- `Mar.sublime-syntax` for highlighting `.mar` files
- `Mar.sublime-completions` for snippets and completions
- `LSP-mar.sublime-settings` for running `mar lsp` through the Sublime `LSP` package

## LSP Notes

The LSP helper assumes `mar` is available in your shell `PATH` and starts it as:

```sh
mar lsp
```

If needed, open the Sublime command palette and use the `LSP` package settings to override the command.
