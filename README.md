# My personal neovim config

### Dependencies

| Package Name | Installation (`Arch Linux`)  |
| ------------ | ---------------------------- |
| Node.js      | `sudo pacman -S nodejs`      |
| NPM          | `sudo pacman -S npm`         |
| Yarn         | `sudo pacman -S yarn`        |
| Tree Sitter  | `sudo pacman -S tree-sitter` |
| Ripgrep      | `sudo pacman -S ripgrep`     |
| FZF          | `sudo pacman -S fzf`         |

**_Install in a single command_**

```shell
$ sudo pacman -S nodejs npm yarn tree-sitter ripgrep fzf
```

### Install LSP (Language Servers)

| Language                               | Installation (`Arch Linux`)                                                           |
| -------------------------------------- | ------------------------------------------------------------------------------------- |
| HTML                                   | `npm install -g vscode-html-languageserver-bin`                                       |
| CSS                                    | `npm install -g vscode-css-languageserver-bin`                                        |
| Javascript                             | `npm install -g typescript typescript-language-server`                                |
| Vue                                    | `npm install -g vls`                                                                  |
| JSON                                   | `npm install -g vscode-json-languageserver`                                           |
| Bash                                   | `npm i -g bash-language-server`                                                       |
| Docker                                 | `npm install -g dockerfile-language-server-nodejs`                                    |
| YAML                                   | `npm install -g yaml-language-server`                                                 |
| Lua                                    | See [lua language server setup guide](https://github.com/sumneko/lua-language-server) |
| EFM ( General purpose language server) | See [efm server setup guide](https://github.com/mattn/efm-langserver)                 |

**Install language server ( availed as npm packages ) in a single command**

```shell
$ sudo pacman -S vscode-html-languageserver-bin vscode-css-languageserver-bin typescript typescript-language-server vls vscode-json-languageserver bash-language-server dockerfile-language-server-nodejs yaml-language-server
```
