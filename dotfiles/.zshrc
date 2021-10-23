[[ -n $SSH_CLIENT && -z $TMUX ]] && exec tmux a

alias borg='borg -p'
alias cp='cp --sparse=always'
alias df='df --exclude-type=fuse'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls -lh --time-style="+%F %H%M%z" --color=auto'
alias mkdir='mkdir -p'
alias py='python'
alias rsync='rsync -h --info=progress2'
alias tree='tree -CDhl --du --timefmt "%Y-%m" --noreport'
alias v='vim'
alias vi='vim'
alias vim='vim -p'
alias xslock='xscreensaver-command -lock'

man() {
    env LESS_TERMCAP_mb=$'\e[01;31m' \
        LESS_TERMCAP_md=$'\e[01;38;5;74m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[38;5;246m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[04;38;5;146m' \
    man $@
}

autoload zmv

setopt alwaystoend
setopt autocd
setopt automenu
setopt autonamedirs
setopt autopushd
setopt autoremoveslash
setopt completealiases
setopt completeinword
setopt correct
setopt extendedglob
setopt extendedhistory
setopt globcomplete
setopt histexpiredupsfirst
setopt histignorealldups
setopt histignoredups
setopt histignorespace
setopt histreduceblanks
setopt histverify
setopt incappendhistory
setopt longlistjobs
setopt multios
setopt nobeep
setopt nocaseglob
setopt noclobber
setopt nohup
setopt numericglobsort
setopt printexitvalue
setopt promptsubst
setopt pushdignoredups
setopt pushdminus
setopt pushdsilent
setopt pushdtohome
setopt rcexpandparam
setopt sharehistory
setopt vi
setopt zle

autoload compinit && compinit

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' verbose yes
zstyle ':completion:*:*:*:*:processes' command 'ps --no-heading axco pid,user,comm -w -w'
zstyle ':completion:*:*:*:users' ignored-patterns adm amanda apache at avahi avahi-autoipd beaglidx bin bitcoin cacti canna clamav colord cups daemon dbus distcache dnsmasq dovecot fax fetchmail ftp games gdm geoclue gkrellmd gopher hacluster haldaemon halt hsqldb i2pd ident ipfs junkbust kdm ldap lightdm lp mail mailman mailnull man messagebus mldonkey monero mpd mysql nagios named netdump news nfsnobody nixbld{1..32} nobody nscd ntp nut nvidia-persistenced nx obsrun openvpn operator pcap polkitd polkituser postfix postgres privoxy pulse pvm quagga radvd rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp tor transmission usbmux uucp uuidd vcsa wwwrun xfs xmrig '_*' 'systemd-*'
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*:hosts' hosts

SAVEHIST=8192
HISTSIZE=8192
HISTFILE='/etc/nixos/dotfiles/.zsh_history'

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey $key[Up] up-line-or-beginning-search
bindkey $key[Down] down-line-or-beginning-search

if [[ -z $IN_NIX_SHELL ]]; then
    any-nix-shell zsh | source /dev/stdin

    fg_color=14
    issue
else
    fg_color=5
fi

direnv hook zsh | source /dev/stdin

autoload -U colors && colors

export PROMPT='
%F{$fg_color}┌─(%n@$(hostname)|%1~)
└─λ%f '
export RPROMPT=''

zle_highlight=(default:fg=$fg_color)

precmd() {
    if [[ -n $_start_time ]]; then
        _delta=$(printf '%.0f' $(($(date '+%s.%N') - $_start_time)))

        if [[ $_delta -gt 5 ]]; then
            echo '\e[0;30;1mCommand executed in' \
                $(units "$_delta s" 'd;hr;min;s' | tr -d '\t' \
                  | sed 's/hr/h/;s/min/m/') '(realtime).'
        fi

        unset _start_time _delta
    fi

    print -Pn '\e]0;%n@%m\a'
}

preexec() {
    _start_time=$(date '+%s.%N')

    echo -n "\e]0;"
    echo -nE "$(head -1 <<< $1 | tr -cd '[:print:]' | sed 's/^ *//')"
    echo -n "\a"
}
