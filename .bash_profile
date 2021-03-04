#   _               _                           __ _ _      
#  | |__   __ _ ___| |__       _ __  _ __ ___  / _(_) | ___ 
#  | '_ \ / _` / __| '_ \     | '_ \| '__/ _ \| |_| | |/ _ \
# _| |_) | (_| \__ \ | | |    | |_) | | | (_) |  _| | |  __/
#(_)_.__/ \__,_|___/_| |_|____| .__/|_|  \___/|_| |_|_|\___|
#                       |_____|_|                           
#echo -n " --> bash_profile"
export BASH_PROFILE_SOURCED="yes"


PATH=$PATH:/usr/local/bin
PATH=$PATH:/Users/bkadel/Library/Android/sdk/platform-tools
PATH=$PATH:/Users/bkadel/git/todo
PATH=$PATH:/Users/bkadel/git/my_scripts
PATH=$PATH:/Users/bkadel/.npm-global
PATH=$PATH:/Users/bkadel/git/easy-dumpsys

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
