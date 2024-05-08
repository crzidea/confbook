# .bash_profile
# User specific environment and startup programs

export DOCKER_HOSTNAME=$HOSTNAME

# tmux need alias redefining
alias ll='ls -l'
alias vi='vim'
alias hostip='ping -c 1 `hostname` | head -n 1 | grep -Eo "([0-9]+\.){3}[0-9]+"'
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

alias docker-ps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}"'
alias docker-rm='docker rm --volumes'
alias python='python3'
alias pip='python3 -m pip'

if [[ -n "$TMUX" && -z "$TMUX_NEED_SOURCE" ]]; then
  # run in tmux
  # prevent overriding PATH on raspberry pi
  export PATH=$_PATH
  return
else
  # run on ssh starting or in tmux with $TMUX_NEED_SOURCE

  # User specific environment and startup programs
  #export LANG=en_US.UTF-8
  export CLICOLOR=1
  export EDITOR=vim

  mkdir -p $HOME/.local
  export PREFIX=$HOME/.local

  # Add PATHs
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  #eval "$(pyenv init -)"

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  PATH=./node_modules/.bin:$HOME/.deno/bin:$PREFIX/bin:$HOME/.local-bin:/opt/homebrew/bin:$PATH
  export PATH

  # backup PATH
  export _PATH=$PATH

  tmux ls >/dev/null 2>&1
  TMUX_NO_SESSION=$?
  if [[ 0 -eq $TMUX_NO_SESSION ]]; then
    # session exist
    if [[ -z "$TMUX_DO_NOT_ATTACH" ]]; then
      tmux attach
    fi
    return
  else
    # no session exist

    ssh-add >/dev/null 2>&1
  fi
fi

