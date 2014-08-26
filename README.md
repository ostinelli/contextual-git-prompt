# Contextual Git Prompt

## Overviewa

Display git information in OSX terminal's prompt.

![Git Prompt Preview](https://raw.github.com/ostinelli/contextual-git-prompt/master/preview.png)

## Installation

The only needed file is `contextual-git-prompt.sh`, that needs to be sourced from your `~/.profile` or `~/.bash_profile`.

I generally have all my bash scripts into the `.bash` directory in my home directory, so I do:

```bash
$ mkdir ~/.bash
$ cd ~/.bash
```

Then I copy the `contextual-git-prompt.sh` file in there. Finally, I ensure that all of the `*.sh` files in `.bash` are sourced from my `~/.bash_profile`:

```bash
for file in ~/.bash/*.sh; do
	[[ -r $file ]] && source $file;
done
```

Restart terminal to see the changes.
