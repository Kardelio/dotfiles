#   _               _                           __ _ _      
#  | |__   __ _ ___| |__       _ __  _ __ ___  / _(_) | ___ 
#  | '_ \ / _` / __| '_ \     | '_ \| '__/ _ \| |_| | |/ _ \
# _| |_) | (_| \__ \ | | |    | |_) | | | (_) |  _| | |  __/
#(_)_.__/ \__,_|___/_| |_|____| .__/|_|  \___/|_| |_|_|\___|
#                       |_____|_|                           
echo -n " --> bash_profile"
export BASH_PROFILE_SOURCED="yes"

PATH=$PATH:/usr/local/bin

if [[ "$BASH_RC_SOURCED" != "yes" ]];then
	if [ -f ~/.bashrc ]; then
		source ~/.bashrc
	fi
fi
