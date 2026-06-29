# Mar for Sublime Text

Syntax highlighting and snippet completions for the [Mar](https://mar-lang.dev) programming language in Sublime Text.

For full language support (diagnostics, hover, completion, go-to-definition, format on save, etc.), install [LSP-mar](https://github.com/marlanghq/mar-sublime-lsp) alongside this package.

## Included

- `Mar.sublime-syntax` — highlights modules, imports, type declarations, pattern matching, lambdas, records, lists, and string/char/number literals.
- `Mar.sublime-completions` — snippets for the common Mar idioms: `module`, `type`, `type alias`, `case`, `if`, `let`, full MVU `page`, Entity, Service, `App.fullstack`, `Auth.config`, UI primitives, and more.

## Installation

Install `Mar` via Package Control.

## Usage

Open any `.mar` file. Syntax highlighting kicks in automatically. Snippets are available via tab-completion; e.g. type `page` then Tab to scaffold a full MVU page.
