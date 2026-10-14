autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
export GPG_TTY=$(tty)

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fnk/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/fnk/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fnk/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/fnk/Applications/google-cloud-sdk/completion.zsh.inc'; fi


if [[ -f $HOME/.docker/init-zsh.sh ]]; then
  source $HOME/.docker/init-zsh.sh || true # Added by Docker Desktop
fi

export PATH="$HOME/bin:$HOME/go/bin:/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

PS1='%F{blue}%B%~%b%f %F{green}❯%f '
precmd () { print -Pn "\e]1;%1~\a"; }

daily_runs() {
  run_daily ~/.brew brew update
}
[ -f ~/.zsh.rc.d/run_daily.zsh ] && source ~/.zsh.rc.d/run_daily.zsh && daily_runs
