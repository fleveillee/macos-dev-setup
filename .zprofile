################### ENV vars ###################

# Make nano the default editor
export EDITOR='nano'

# Disable LESS pagination (fix for git)
export LESS=-FRX

################### PATH ###################

# Added by JetBrains Toolbox App
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# Setting PATH for Python 3.12
export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"

# Setting PATH for Ruby from Homebrew Install
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"


################### Homebrew ###################

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# No ENV var hints for Homebrew
#export HOMEBREW_NO_ENV_HINTS=true

#export HOMEBREW_NO_AUTO_UPDATE=true

# Shell completions for ZSH
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi


################### NVM - Node Version Manager ###################

# NVM lines from Homebrew Install
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


################### SDKMAN ###################

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


################### PHPBREW ##################

export PHPBREW_SET_PROMPT=1

source ~/.phpbrew/bashrc

################### aliases ###################

# Git Reset Hard Alias
alias clr='git reset HEAD --hard && git clean -f -d'

# Component Plugin Aliases
#alias archie='shopify theme component'
#alias component='shopify theme component'

###### Run updates daily ######

BREW_STYLE_POINTER="$(tput bold)$(tput setaf 4)==>$(tput setaf 7)"

### Individual Update Aliases
alias updatebrew='brew update && brew upgrade'
alias updatenode='echo "\n$BREW_STYLE_POINTER Updating Node.js through NVM...$(tput sgr0)" && nvm install stable --default'
alias updategnp='echo "\n$BREW_STYLE_POINTER Updating Global NPM Packages...$(tput sgr0) " &&npm update --global'

### Collated Update Aliases
UPDATES_ALIAS='updatebrew'
# Add Node.js Update through NVM if NVM is present
command -v nvm &> /dev/null && UPDATES_ALIAS="${UPDATES_ALIAS} && updatenode"
# Add Global Node.js Packages Update through NPM if NPM is present
command -v npm &> /dev/null && UPDATES_ALIAS="${UPDATES_ALIAS} && updategnp"

alias updates=$UPDATES_ALIAS


### Automate Daily RUN - Excluding IntelliJ Embedded Shell
if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
	marker_file="$HOME/.updates_last_run_date"

	if [[ ! -f "$marker_file" ]]; then
    	# Create the marker file with today's date
    	echo "$(date +%Y-%m-%d)" > "$marker_file"
    	updates
	else
    	# Read the date from the marker file
    	stored_date=$(cat "$marker_file")
    	today=$(date +%Y-%m-%d)

    	if [[ "$stored_date" != "$today" ]]; then
        	# If the stored date is not today, update it and run the command
        	echo "$today" > "$marker_file"
        	updates
    	fi
	fi
fi
