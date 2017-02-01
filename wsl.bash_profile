# .bash_profile
# Fix unask
umask 022

# Auto start ssh-agent for every session
pgrep ssh-agent >/dev/null
ssh_agent_not_alive=$?
ssh_agent_path_prefix=ssh-agent-$USER
if [[ 1 -eq $ssh_agent_not_alive ]]; then
    rm $ssh_agent_path_prefix.* 2>/dev/null
    ssh-agent -a $ssh_agent_path_prefix.sock >$ssh_agent_path_prefix.profile
fi
source $ssh_agent_path_prefix.profile >/dev/null

# You probably do not like to use `tmux`
export TMUX_DO_NOT_ATTACH=1
