# .bash_profile
# Fix unask
umask 022
# Auto start ssh-agent for every session
eval `ssh-agent` >/dev/null
# You probably do not like to use `tmux`
export TMUX_DO_NOT_ATTACH=1
