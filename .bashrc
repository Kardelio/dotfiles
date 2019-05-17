#   _               _              
#  | |__   __ _ ___| |__  _ __ ___ 
#  | '_ \ / _` / __| '_ \| '__/ __|
# _| |_) | (_| \__ \ | | | | | (__ 
#(_)_.__/ \__,_|___/_| |_|_|  \___|
# 

echo -n " --> bashrc"
export BASH_RC_SOURCED="yes"
export EDITOR=vim
export LSCOLORS=heHfcxdxhbegedabagacad  
export PROMPT_COMMAND="insult update_terminal_cwd"

alias tmux="TERM=screen-256color-bce tmux"
alias transfer=transfer

# Super vital below for colorized terminal output between Mac and Linux
ls --color=al > /dev/null 2>&1 && alias ls='ls -F --color=al' || alias ls='ls -GF'

if [[ "$BASH_PROFILE_SOURCED" != "yes" ]];then
	if [ -f ~/.bash_profile ]; then
		source ~/.bash_profile
	fi
fi
if [ -f ~/.bash_aliases_bk ]; then
	source ~/.bash_aliases_bk
fi

function gitrep(){
	res=$(find . -maxdepth 1 -name ".git" )
	if [[ ! -z $res ]];then
		num=$(git status --porcelain | wc -l | tr -d ' ')
		bran=$(git symbolic-ref --short HEAD)
		stashes=$(git stash list | wc -l | sed 's/ //g')
		if [[ "$stashes" -gt 0 ]]; then
			# Does the stash contain stash from this branch
			sss=$(git stash list | grep "$bran" | wc -l | sed 's/ //g')
			if [[ "$sss" -gt 0 ]]; then
				stashes="$stashes!"
			fi
		fi
		branches=$(git branch | wc -l | sed 's/ //g')
		echo -e " \033[44;37;1m$bran\033[0m \033[31m$num\033[0m \033[33m$stashes\033[0m \033[36m$branches\033[0m "
	fi
}


function doesBranchHaveParent(){
	res=$(find . -name ".git" -maxdepth 1)
	if [[ ! -z $res ]];then
		if [[ -f ~/.gitstory ]]; then
			repo=$(git rev-parse --show-toplevel)
			bran=$(git symbolic-ref --short HEAD)
			justOurLines=$(cat ~/.gitstory | grep "$repo" | grep "$bran" )
			while read -r line; do
				justBranch="${line#*+++++}"
				if [[ "$justBranch" =~ .*":::::".* ]];then
					parentBranch=${justBranch#*:::::}
					justName=${justBranch//:::::*/}
					parentBranch=${parentBranch#*/}
					echo -e " \033[30;43m$parentBranch\033[0m"
					break
				fi
			done <<< "$justOurLines"
		fi	
	fi	
}

export PS1="\[\e[33m\]\$? - \[\e[36m\]\v - \$(gitrep)\[\e[35m\]\W$\[\e[0m\]"

mkcd (){
	mkdir -p -- "$1" && cd -P -- "$1"
}

gitwho(){
	git config user.name
	git config user.email
}


function insult {
	captured=$?

	if [ $captured -eq 127 ]
	then
        	print_insult
	fi
}

# ----- The Insulter was Adapted from another Repo ----
# Adapted from https://github.com/hkbakke/bash-insulter
function print_insult () {

    local messages
    local message

    messages=(
        "Boooo!"
        "Don't you know anything?"
        "RTFM!"
        "Haha, n00b!"
	"Who are you?!"
        "Wow! That was impressively wrong!"
        "Pathetic"
        "The worst one today!"
        "n00b alert!"
        "Your application for reduced salary has been sent!"
        "lol"
        "u suk"
        "lol... plz"
        "plz uninstall"
        "And the Darwin Award goes to.... ${USER}!"
        "ERROR_INCOMPETENT_USER"
        "Incompetence is also a form of competence"
        "Bad."
        "Come the f*** on!"
		"Fake it till you make it!"
        "What is this...? Amateur hour!?"
        "Come on! You can do it!"
        "Nice try."
		"Get your shit together. Get it all together, and put it in a backpack, all your shit, so it's together. And if you gotta take it somewhere, take it somewhere. You know? Take it to the shit store and sell it. Or put it in a shit museum, I don't care what you do, you just gotta get it together. Get your shit together."
        "What if... you type an actual command the next time!"
        "What if I told you... it is possible to type valid commands."
        "Y u no speak computer???"
        "This is not Windows"
        "Perhaps you should leave the command line alone..."
        "Please step away from the keyboard!"
        "error code: 1D10T"
        "ACHTUNG! ALLES TURISTEN UND NONTEKNISCHEN LOOKENPEEPERS! DAS KOMPUTERMASCHINE IST NICHT FÜR DER GEFINGERPOKEN UND MITTENGRABEN! ODERWISE IST EASY TO SCHNAPPEN DER SPRINGENWERK, BLOWENFUSEN UND POPPENCORKEN MIT SPITZENSPARKEN. IST NICHT FÜR GEWERKEN BEI DUMMKOPFEN. DER RUBBERNECKEN SIGHTSEEREN KEEPEN DAS COTTONPICKEN HÄNDER IN DAS POCKETS MUSS. ZO RELAXEN UND WATSCHEN DER BLINKENLICHTEN."
        "Pro tip: type a valid command!"
        "Go outside."
        "This is not a search engine."
        "(╯°□°）╯︵ ┻━┻"
        "¯\_(ツ)_/¯"
        "So, I'm just going to go ahead and run rm -rf / for you."
        "Why are you so stupid?!"
        "Perhaps computers is not for you..."
        "Why are you doing this to me?!"
        "Don't you have anything better to do?!"
        "I am _seriously_ considering 'rm -rf /'-ing myself..."
        "This is why you get to see your children only once a month."
        "This is why nobody likes you."
        "Are you even trying?!"
        "Try using your brain the next time!"
        "My keyboard is not a touch screen!"
        "Commands, random gibberish, who cares!"
        "Typing incorrect commands, eh?"
        "Are you always this stupid or are you making a special effort today?!"
        "Dropped on your head as a baby, eh?"
        "Brains aren't everything. In your case they're nothing."
        "I don't know what makes you so stupid, but it really works."
        "You are not as bad as people say, you are much, much worse."
        "Two wrongs don't make a right, take your parents as an example."
        "You must have been born on a highway because that's where most accidents happen."
        "If what you don't know can't hurt you, you're invulnerable."
        "If ignorance is bliss, you must be the happiest person on earth."
        "You're proof that god has a sense of humor."
        "Keep trying, someday you'll do something intelligent!"
        "If shit was music, you'd be an orchestra."
        "How many times do I have to flush before you go away?"
    )

    # If CMD_NOT_FOUND_MSGS array is populated use those messages instead of the defaults
    [[ -n ${CMD_NOT_FOUND_MSGS} ]] && messages=( "${CMD_NOT_FOUND_MSGS[@]}" )

    # If CMD_NOT_FOUND_MSGS_APPEND array is populated append those to the existing messages
    [[ -n ${CMD_NOT_FOUND_MSGS_APPEND} ]] && messages+=( "${CMD_NOT_FOUND_MSGS_APPEND[@]}" )

    # Seed RANDOM with an integer of some length
    RANDOM=$(od -vAn -N4 -tu < /dev/urandom)

    # Print a randomly selected message, but only about half the time to annoy the user a
    # little bit less.
    #if [[ $((${RANDOM} % 2)) -lt 1 ]]; then
    message=${messages[${RANDOM} % ${#messages[@]}]}
    printf "\n  $(tput bold)$(tput setaf 1)${message}$(tput sgr0)\n\n"
    #fi
}

transfer() {
    curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) | tee /dev/null;
}

if [[ -z "$TMUX" ]] && [[ "$TERM_PROGRAM" != "vscode" ]]; then
	#Not running in a tmux session or in a vscode terminal
	echo "Do normal terminal scripts here..." > /dev/null
fi
if [ -n "$TMUX" ]; then
	echo -e "\033[37;44m Running inside of TMUX, Enjoy! \033[0m"
fi
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
	echo -e "\033[37;44m Running inside of VSCODE, Enjoy! \033[0m"
fi

# BELOW is s way to overwrite git commands so you can intercept them and do your own things
#git() { 
#	if [[ $1 == "checkout" ]]; then 
#		command git "$@" && /path_to_script
#	else 
#		command git "$@" 
#	fi
#}

echo "$SHELL - $TERM"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
