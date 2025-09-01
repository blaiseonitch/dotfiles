# Created by newuser for 5.9
# ~/.zshrc
#


#Aliases

[[ $- != *i* ]] && return
alias patchdwm="patch -F3 -i"
alias cdwm="vim ~/dwm/config.h"
alias mkdwm="cd ~/dwm; sudo make clean install; cd -"
alias kitheme='kitty +kitten themes'
alias tm='tmux'
alias vim='nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ff='clear && fastfetch'
alias momo='momoisay -f'
alias asciimov='ascii-movie play'
alias screenrec-with-mic='wf-recorder -a -f ~/YOTUBE/recordings/recording-$(date +%F_%H-%M-%S).mp4' #screen record with mic
alias screenrec-no-mic="ffmpeg -video_size 1366x768 -framerate 25 -f x11grab -i :0.0 output.mp4" 
alias weather='curl wttr.in' #Check weather

PS1='[\u@\h \W]\$ '

export CLANG_FORMAT_STYLE="file:~/.clang-format"
export PATH=$PATH:/home/blaze/.local/bin
export TERM="xterm-256color"
export TERMINAL="kitty"
export PATH="$HOME/vcpkg:$PATH"
. "$HOME/.cargo/env"
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_NDK_HOME=$HOME/Android/Sdk/ndk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools
export PATH="$HOME/butler-exe:$PATH"


eval "$(starship init zsh)"

