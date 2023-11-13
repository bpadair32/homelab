~/greeting.sh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=/home/bpadair/.local/bin:/home/bpadair/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin

export ZSH=/Users/${USER}/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
HYPHEN_INSENSITIVE="true"

export UPDATE_ZSH_DAYS=7

ENABLE_CORRECTION="true"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#Make some basic functions more useful
alias ls="ls -la --color"
alias grep="grep --color=auto"
alias python="python3"
alias pip="pip3"

#Quick directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"

#Count files in directory
alias countFiles="echo $(ls -1 | wc -l)"

#Get external IP address
alias my-ip="curl ipinfo.io/ip"

#Automatically make parent directories when mkdir
alias mkdir="mkdir -pv"

#Use tmux instead of screen
alias screen="tmux"

#Manage profile
alias editProf="nvim ~/.zshrc"
alias reload="source ~/.zshrc"

#Annoying commands I can never remember
alias ports='netstat -a | grep -i "listen"'
alias backup='tar -zcvf $(date +%Y%m%d).tar.gz *'
alias extract='for i in *.gz; do tar xvf $i; done'

alias weather='function _weather() { \curl wttr.in/$i; }; _weather'
alias jsonpretty='function _jsonpretty() { python -m json.tool $1; } _jsonpretty'

function monitorProcess() {
  while true; do
    if ! pgrep -f $1; then
      echo "Process $1 has completed." | mail -s "Process Complete" ${USER}.tech
      break
    fi
    sleep 60
  done
}

function websiteStatus() {
  curl -s --head --request GET $1 | grep "200 OK"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
