# Contextual Git Prompt
# <http://github.com/ostinelli/contextual-git-prompt>
# Original code portions from <https://github.com/jimeh/git-aware-prompt>

# Colors
txtred="$(tput setaf 1)"
txtgreen="$(tput setaf 2)"
txtyellow="$(tput setaf 3)"
txtcyan="$(tput setaf 6)"
txtreset="$(tput sgr0)"

find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='*detached*'
    fi
  fi
  echo $branch
}

find_git_dirty() {
  local dirty
  if [[ $(git status --porcelain 2> /dev/null) != "" ]]; then
    dirty=1
  elif [[ $(git status 2> /dev/null) == *"Your branch is ahead"* ]]; then
    dirty=2
  fi
  echo $dirty
}

git_aware_prompt() {
  local git_branch=$(find_git_branch)
  local git_dirty=$(find_git_dirty)

  if [[ $git_branch != "" ]]; then
    if [[ $git_dirty == "1" ]]; then
      echo "$txtgreen | $git_branch$txtred ✗ $txtgreen|$txtreset"
    elif [[ $git_dirty == "2" ]]; then
      echo "$txtgreen | $git_branch$txtyellow ~ $txtgreen|$txtreset"
    else
      echo "$txtgreen | $git_branch ✓ |$txtreset"
    fi
  fi
}

export PS1="\n${txtcyan}\h: ${txtyellow} \w ${txtreset}\$(git_aware_prompt)\n\$ "
