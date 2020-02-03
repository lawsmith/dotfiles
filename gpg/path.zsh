# This ugly section of code gets GPG and GPG-AGENT to work on MacOS
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
fi
GPG_TTY=$(tty)
export GPG_TTY
if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi
# There is no straight forward way to detect if gpg-agent is running. If you try to run
# gpg-agent while it's already running, it displays an annoying error message whenever
# a new terminal session is opened. So work around this, I'm piping everything from
# gpg-agent to /dev/null to get rid of the message and then check the exit code to
# see if it has already been running.
if ! gpg-agent /bye > /dev/null 2>&1; then
  eval $(gpg-agent --daemon)
fi