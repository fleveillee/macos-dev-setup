################### Oh My ZSH ###################

# Override Oh My ZSH default Terminal titles
export ZSH_THEME_TERM_TITLE_IDLE="%1d"
export ZSH_THEME_TERM_TAB_TITLE_IDLE="%1d"

# Jovial theme symbols alterations
export JOVIAL_SYMBOL[arrow.git-clean]='─➤'
export JOVIAL_SYMBOL[arrow.git-dirty]='─➤'
export JOVIAL_SYMBOL[git.dirty]='✘'
export JOVIAL_PROMPT_ORDER=( path git-info )

JOVIAL_AFFIXES[path.prefix]='${JOVIAL_PALETTE[normal]}['
JOVIAL_AFFIXES[current-dir]='%~'
JOVIAL_AFFIXES[path.suffix]='${JOVIAL_PALETTE[normal]}]'
JOVIAL_AFFIXES[git-info.prefix]=' ${JOVIAL_PALETTE[conj.]}on '
JOVIAL_AFFIXES[git-info.suffix]=''

####### Overwrites Oh My ZSH Bad Aliases #######
# We are using GNU ls to be able to group directories first
# Requires 'brew install coreutils'
alias ll='gls -lAhp --color=auto --group-directories-first'
