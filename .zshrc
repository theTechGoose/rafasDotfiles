~/scripts/login.zsh
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


          # /$$$$$$$   /$$$$$$  /$$$$$$$$ /$$$$$$ 
        # | $$__  $$ /$$__  $$| $$_____//$$__  $$
        # | $$  \ $$| $$  \ $$| $$     | $$  \ $$
        # | $$$$$$$/| $$$$$$$$| $$$$$  | $$$$$$$$
        # | $$__  $$| $$__  $$| $$__/  | $$__  $$
        # | $$  \ $$| $$  | $$| $$     | $$  | $$
        # | $$  | $$| $$  | $$| $$     | $$  | $$
        # |__/  |__/|__/  |__/|__/     |__/  |__/
          #   /$$    /$$ /$$$$$$ /$$      /$$       
          #  | $$   | $$|_  $$_/| $$$    /$$$       
          #  | $$   | $$  | $$  | $$$$  /$$$$       
          #  |  $$ / $$/  | $$  | $$ $$/$$ $$       
          #   \  $$ $$/   | $$  | $$  $$$| $$       
          #    \  $$$/    | $$  | $$\  $ | $$       
          #     \  $/    /$$$$$$| $$ \/  | $$       
          #      \_/    |______/|__/     |__/       
#
#           Personal .zshrc file of Rafa Castro <Rafac@monsterrg.com>
#

# Plugins {{{
# ==============================================================================
autoload -Uz compinit
compinit
    # Load the Antibody plugin manager for zsh.
    source <(antibody init)

    # Setup required env var for oh-my-zsh plugins
    export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

    antibody bundle robbyrussell/oh-my-zsh
    antibody bundle robbyrussell/oh-my-zsh path:plugins/adb
    antibody bundle robbyrussell/oh-my-zsh path:plugins/bower
    antibody bundle robbyrussell/oh-my-zsh path:plugins/composer
    antibody bundle robbyrussell/oh-my-zsh path:plugins/cp
    antibody bundle robbyrussell/oh-my-zsh path:plugins/dnf
    antibody bundle robbyrussell/oh-my-zsh path:plugins/docker
    antibody bundle robbyrussell/oh-my-zsh path:plugins/docker-compose
    antibody bundle robbyrussell/oh-my-zsh path:plugins/git
    antibody bundle robbyrussell/oh-my-zsh path:plugins/git-flow
    antibody bundle robbyrussell/oh-my-zsh path:plugins/gulp
    antibody bundle robbyrussell/oh-my-zsh path:plugins/httpie
    antibody bundle robbyrussell/oh-my-zsh path:plugins/jsontools
    antibody bundle robbyrussell/oh-my-zsh path:plugins/jump
    antibody bundle robbyrussell/oh-my-zsh path:plugins/nmap
    antibody bundle robbyrussell/oh-my-zsh path:plugins/npm
    antibody bundle robbyrussell/oh-my-zsh path:plugins/pass
    antibody bundle robbyrussell/oh-my-zsh path:plugins/rsync
    antibody bundle robbyrussell/oh-my-zsh path:plugins/z
    antibody bundle robbyrussell/oh-my-zsh path:plugins/fzf

    # Other bundles
    antibody bundle sampson-chen/sack
    #antibody bundle jessarcher/zsh-artisan
    antibody bundle zsh-users/zsh-autosuggestions

    # This needs to be the last bundle.
    antibody bundle zsh-users/zsh-syntax-highlighting

    # Load the theme.
    # antibody bundle robbyrussell/oh-my-zsh path:themes/robbyrussell.zsh-theme
    antibody bundle dracula/zsh

# }}}

# Configuration {{{
# ==============================================================================

    HYPHEN_INSENSITIVE="true"
    yarn config set ignore-engines true >/dev/null
    ENABLE_CORRECTION="false"
    COMPLETION_WAITING_DOTS="true"
    HIST_STAMPS="yyyy-mm-dd"

    typeset -U path cdpath fpath

    # Vim mode
    bindkey -v
    export KEYTIMEOUT=1

 export NNN_OPTS="H"
 export ANDROID_HOME="$HOME/Android/Sdk/"
 export EDITOR=nvim
 export VISUAL=$EDITOR

    export GIT_EDITOR=vim

    path=(
        $HOME/.local/bin
        $HOME/.bin
        $HOME/bin
        $HOME/.composer/vendor/bin
        $HOME/.go/bin
        ./vendor/bin
        ${ANDROID_HOME}tools/
        ${ANDROID_HOME}platform-tools/
        $path

    )

    setopt auto_cd
    cdpath=(
        $HOME/Code
    )

    zstyle ':completion:*' group-name ''
    zstyle ':completion:*:descriptions' format %d
    zstyle ':completion:*:descriptions' format %B%d%b
    zstyle ':completion:*:complete:(cd|pushd):*' tag-order \
            'local-directories named-directories'

    export EDITOR='vim'
    export NVIM_LISTEN_ADDRESS='/tmp/nvimsocket'
    export ARTISAN_OPEN_ON_MAKE_EDITOR='nvr'
    export FZF_DEFAULT_COMMAND='ag -u -g ""'

    unsetopt sharehistory
    
    # VIMRUNTIME=runtime ~/nvimBuilds/neovim/build/bin/nvim

# }}}

# Aliases & Functions {{{
# ==============================================================================


createJypNotebook() {
python3 -m jupyter_ascending.scripts.make_pair --base $1
}


redrawBorders() {
    yabai -m config window_border off
    yabai -m config window_border on
}

    # Laravel
    alias a="artisan"
    alias tinker="artisan tinker"
    alias serve="artisan serve"
    alias mfs="artisan migrate:fresh --seed"
    homestead() {
        ( cd ~/Homestead && vagrant $* )
    }

function restart-yabai() {
    node ./.config/yabaiStart.js&
}

function img-data() {
  TYPE=$(file --mime-type -b $1)
  ENC=$(base64 $1)
  echo "data:$TYPE;base64,$ENC"
}

rc() {
    source ~/.zshrc
}

    # Git
    alias g="git"
    alias gs="git s"
    alias nah="git reset --hard;git clean -df"
    alias co="git checkout"

    # Docker
    alias d="docker"
    alias dc="docker-compose"
    alias dce="docker-compose exec"
    alias dcea="docker-compose exec app"
    dceas () {
        docker-compose exec app su app -c "$*"
    }
    alias dceasa="dceas php artisan"

    # General
    alias vim="nvim"
    alias mux="tmuxinator"
    alias copy="xclip -selection clipboard"
    alias paste="xclip -o -selection clipboard"
    alias ag="sag"
    alias cat="bat"
    alias webcam="gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video1"

    # Open vim with z argument
    v() {
      if [ -n "$1" ]; then
          z $1
      fi

      nvim
    }

sw() {
    yabai -m window --swap last
}

    # Open configs
    conf() {
      wd=$(pwd)
      cd
      cd Documents/infrastructure/rafasDotfiles
      echo $( pwd )
      query=$(rg --files -g '!*coc*' | fzf --layout=reverse)
      if  [[ -n "${query// /}" ]]; then
        nvim $query
      fi
      cd
      cd $wd
    }
    # Open zshconfig
    zconf() {
      wd=$(pwd)
      cd
      nvim .zshrc
      cd
      cd wd
    }
# Open development 
od() {
    cd
    cd documents/programming/
}

    # Open with vim
    o() {
    wd=$(pwd)
    cd
    cd Documents/programming

      testQuery=$(ls | fzf)
      if  [[ -n "${testQuery// /}" ]]; then
          query=$(find . -name package.json ! -path '*/node_modules/*' )
          nvim $query +NERDTreeToggle
          openVim
      fi
      cd
      cd $wd
    }

openVim() {
    query=$(find . -name package.json ! -path '*/node_modules/*' )
    if  [[ -n "${query// /}" ]]; then
        # nvim $query +NERDTreeToggle
        echo $query
    else
        echo 'No package.json found'
    fi
}

    # Open with no bells and whistles (for performance)
    ob() {
      query=$(rg --files -g '!*node_modules' -g '!*Library' -g '!*Pictures' | fzf --layout=reverse)
      if  [[ -n "${query// /}" ]]; then
        echo $query
        nvim -u "NONE" $query +syntax off
      fi
    }

    # cd() {
    #     cd $1 && eval ls
    # }
    # alias cd="cdls"
    open () {
        xdg-open $* > /dev/null 2>&1
    }

    if (( $+commands[tag] )); then
        tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
        alias ag=tag
    fi


    rll() {
        pkill node
        pkill limelight
        (node ./.config/limelight.js)&
        disown
    }

createNotebook() {
    python3 -m jupyter_ascending.scripts.make_pair --base $1
}

listProcesses() {
    ps aux | grep yabai
}

qt() {
    quicktype $1 -o $2 --just-types
}

# }}}

# Interactive shell startup scripts {{{
# ==============================================================================


#rll
    # if [[ $- == *i* && $0 == '/bin/zsh' ]]; then
    # fi
    

# }}}

# vim: set nospell foldmethod=marker foldlevel=0:
#


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme


source ~/powerlevel10k/powerlevel10k.zsh-theme
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH="~/.pyenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export NEOVIDE_FRAMELESS=true
-e 
alias luamake=/Users/goose/.cache/nvim/nlua/sumneko_lua/lua-language-server/3rd/luamake/luamake

# bun completions
[ -s "/Users/goose/.bun/_bun" ] && source "/Users/goose/.bun/_bun"

# bun
export BUN_INSTALL="/Users/goose/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
