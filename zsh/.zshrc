eval "$(zoxide init zsh)"
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

export SPACESHIP_CONFIG="$HOME/.config/spaceship.zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# User configuration

# Autosuggest settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#663399,standout"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
if [[ "$OSTYPE" == 'linux-gnu' ]]; then
  alias pdfopen="sioyek"
elif [[ $OSTYPE == "darwin"* ]]; then
fi

if [[ "$OSTYPE" == 'linux-gnu' ]]; then
  # In Linux
  # Initialize spaceship-prompt
  source /usr/lib/spaceship-prompt/spaceship.zsh
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  # Initialize nvm
  . /usr/share/nvm/init-nvm.sh
  export SSH_AUTH_SOCK="~/.1password/agent.socket"
elif [[ $OSTYPE == "darwin"* ]]; then
  # Initialize spaceship-prompt
  source /opt/homebrew/opt/spaceship/spaceship.zsh
  source /opt/homebrew/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /opt/homebrew/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  # initialize nvm
  export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  export PATH="$HOME/.tmuxifier/bin:$PATH"
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  export NODE_EXTRA_CA_CERTS="$HOME/netskope-chain.pem"

fi

eval "$(tmuxifier init -)"
export ATLASSIAN_SITE_URL=$ATLASSIAN_SITE_URL
export ATLASSIAN_USER_EMAIL=$ATLASSIAN_USER_EMAIL
export ATLASSIAN_API_TOKEN=$ATLASSIAN_API_TOKEN

