# chezmoi

chezmoi enables you to declare the desired state of my dotfiles in a `home/` directory (configured by `.chezmoiroot`).
chezmoi can be `init`-ialized on a new machine which enables it to `apply` the desired state.
The desired state is built through features such as:

- templates (to handle small differences between machines)
- password manager (to store your secrets securely)
- importing files from archives (great for shell and editor plugins)
- full file encryption (using age, gpg, git-crypt, or transcrypt)
- running scripts (to handle everything else)

chezmoi also has the ability to `update` your dotfiles in a single command.

## Common commands

| Command                          | Description                                                                         |
| :------------------------------- | :---------------------------------------------------------------------------------- |
| `chezmoi doctor`                 | checks for common problems. If you encounter something unexpected, run this first   |
| `chezmoi add $FILE`              | adds `$FILE` from your home directory to the source directory                       |
| `chezmoi edit $FILE`             | opens your editor with the file in the source directory that corresponds to `$FILE` |
| `chezmoi status`                 | gives a quick summary of what files would change if you ran chezmoi apply           |
| `chezmoi diff`                   | shows the changes that chezmoi apply would make to your home directory              |
| `chezmoi apply`                  | updates your dotfiles from the source directory                                     |
| `chezmoi edit --apply $FILE`     | is like chezmoi edit `$FILE` but also runs chezmoi apply `$FILE` afterwards         |
| `chezmoi cd`                     | opens a subshell in the source directory                                            |
| `chezmoi data`                   | prints the available template data                                                  |
| `chezmoi add --template $FILE`   | adds `$FILE` as a template                                                          |
| `chezmoi chattr +template $FILE` | makes an existing `$FILE` a template                                                |
| `chezmoi cat $FILE`              | prints the target contents of `$FILE`, without changing `$FILE`                     |
| `chezmoi execute-template`       | is useful fortesting and debugging templates                                        |

## Templating

Chezmoi uses Go `text/template` syntax. Template data variables (defined in `.chezmoi.toml.tmpl`):

| Variable      | Type   | Source                                                                 |
| ------------- | ------ | ---------------------------------------------------------------------- |
| `.osid`       | string | Auto-detected: `"linux-debian"`, `"linux-ubuntu"`, `"linux-linuxmint"` |
| `.iswsl`      | bool   | Auto-detected from `/proc/version`                                     |
| `.isheadless` | bool   | Prompted on first apply                                                |
| `.email`      | string | Prompted on first apply                                                |

Conditional example:

```
{{ if eq .osid "linux-linuxmint" }}...{{ end }}
{{ if .iswsl }}...{{ end }}
```

Files with `.tmpl` extension are processed as templates. Prefix `dot_` maps to `.` in the home directory.
