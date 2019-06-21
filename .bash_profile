export CLICOLOR='true'
export LSCOLORS="GxFxCxDxBxegedabagaced"

export GREP_OPTIONS='--color=auto'

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
#export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

alias ll='ls -lah

export PIPENV_VENV_IN_PROJECT=1'

export PYENV_ROOT=/usr/local/opt/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias lsusb="system_profiler SPUSBDataType"
alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

LD_LIBRARY_PATH=/usr/local/Cellar/openssl/1.0.2q/lib:"${LD_LIBRARY_PATH}"
CPATH=/usr/local/Cellar/openssl/1.0.2q/include:"${CPATH}"
PKG_CONFIG_PATH=/usr/local/Cellar/openssl/1.0.2q/lib/pkgconfig:"${PKG_CONFIG_PATH}"
export LD_LIBRARY_PATH CPATH PKG_CONFIG_PATH

