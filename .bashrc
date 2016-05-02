# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# export PS1="[\u@\h \W]\$ "

# Aliases
alias psql-cli='psql -p 5432 -h localhost -d postgres'

# Get and display git branch
parse_git_branch() {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

export PS1="\[\033[90m\]\u@\h\[\033[00m\] \W\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$ "
