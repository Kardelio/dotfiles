##

DO NOT USE setupDialog for android BottomSheetDialogFragment
INSTEAD use the oncreate and onViewCreated methods as usual##

## Python

    pip3 install virtualenv
    virtualenv mypy
    source mypy/bin/activate
    which python
    which pip
    (pip install ...)
    pip freeze --local > requirements.txt
    deactivate
    which python
   
to delete virtual env simply rm -rf folder

on another env

    pip install -r requirements.txt

to install those previous packages

    from file import class, orFunction
    from package.module import class, orFunction

## Use specific ssh key for git clone

    ssh-agent bash -c 'ssh-add /somewhere/yourkey; git clone git@github.com:user/project.git'

not tried this yet but: would be the config change to make git use specific ssh command and key
    git config core.sshCommand "ssh -i ~/.ssh/id_rsa_example -F /dev/null"

## Vim run line as command

    :exec '!'.getline('.')

## mitmproxy and curl

for https
* turn VPN off
* start the mitmproxy
* go to mitm.it
* download and install the cert
    mitm.it/cert/pem
now https should work

press 'f' to filter results 

    curl --proxy http://127.0.0.1:8080 google.com
    curl --proxy http://127.0.0.1:8080 https://google.com
    curl -k --proxy http://127.0.0.1:8080 https://google.com
    curl -k --proxy http://127.0.0.1:8080 https://www.google.com
    curl -k --proxy http://127.0.0.1:8080 https://duckduckgo.com
    curl -k --proxy http://127.0.0.1:8080 https://very.co.uk
    curl -k --proxy http://127.0.0.1:8080 https://www.very.co.uk
    curl -k --proxy http://127.0.0.1:8080 very.co.uk
    curl -k --proxy http://127.0.0.1:8080 'https://www.very.co.uk/'   -H 'authority: www.very.co.uk'   -H 'pragma: no-cache'   -H 'cache-control: no-cache'   -H 'upgrade-insecure-requests: 1'   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'   -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'   -H 'sec-fetch-site: none'   -H 'sec-fetch-mode: navigate'   -H 'sec-fetch-user: ?1'   -H 'sec-fetch-dest: document'   -H 'accept-language: en-GB,en-US;q=0.9,en;q=0.8'
    curl -k --proxy http://127.0.0.1:8080 'https://www.very.co.uk/'   -H 'authority: www.very.co.uk'   -H 'pragma: no-cache'   -H 'cache-control: no-cache'   -H 'upgrade-insecure-requests: 1'   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'   -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'   -H 'sec-fetch-site: none'   -H 'sec-fetch-mode: navigate'   -H 'sec-fetch-user: ?1'   -H 'sec-fetch-dest: document'   -H 'accept-language: en-GB,en-US;q=0.9,en;q=0.8'   -H 'test: 1234'

BELOW is a working very curl using mitmproxy to intercept
    curl -k --proxy http://127.0.0.1:8080 'https://www.very.co.uk/'   -H 'authority: www.very.co.uk'   -H 'pragma: no-cache'   -H 'cache-control: no-cache'   -H 'upgrade-insecure-requests: 1'   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'   -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'   -H 'sec-fetch-site: none'   -H 'sec-fetch-mode: navigate'   -H 'sec-fetch-user: ?1'   -H 'sec-fetch-dest: document'   -H 'accept-language: en-GB,en-US;q=0.9,en;q=0.8'   -H 'test: 1234'

## Proxy on android device

    echo test
    adb shell settings put global http_proxy 192.168.178.35:8080
    adb shell settings put global http_proxy :0

## DnDBeyond Character Service

https://character-service.dndbeyond.com/character/v3/character/{cheracterId}
Akvari - 38892604
Lyra - 38896484
Scarboro - 38891649
Thyrmir - 38896485

info notes from the API

data.classes[0].level
data.classes[0].definition.name
data.classes[0].definition.hitDice
data.name

data.race.baseRaceName
.fullName

data.background.definition.name


data.classes[0].classFeatures[].definition.name
data.classes[0].classFeatures[].definition.snippet

data.modifiers{}.
//background[], race[], class[], condition[], feat[], item[]
race[]{}
"Dexterity Score"
id: 1608

## Docker stuff

List all running docker containers on the system
    docker ps

Copy a file to a docker containers
    docker cp <file> <docker_iamge_id>:<path>

reconnect to already running container
    docker exec -it <container_id> /bin/bash

alpine image uses apk instead of apt or pacman (package manager)

    apk add gnupg

## How to generate an SSH key for Bitbucket
create an ssh key
    ssh-keygen

The above command has more options for security etc...e.g.
    #Larger byte amount
    ssh-keygen -t rsa -b 4096
    #Password
    ssh-keygen -p 

From Bitbucket, choose Personal settings from your avatar in the lower left.
Add the public version of the key
most likely ```id_rsa.pub```

Then set up your remote url to include the ssh version
    git@bitbucket.org:/USER/REPO

## NPM Http Server

    npm install http-server -g
    http-server

## Terminal convert x image type to jpg

        # install imagemagick
        brew install imagemagick

        # convert a single image
        magick convert foo.HEIC foo.jpg

        # bulk convert multiple images
        magick mogrify -monitor -format jpg *.HEIC

    return input.split("").reverse().join("");
## ADB Screengrab in case i lose it

    alias screengrab='adb exec-out screencap -p > ~/Desktop/Screens/screen-$(date +%s).png'

## Git change default branch name
Github now does this already after a recent update, if you create the first commit on github.
As of v 2.28 the git terminal client (installable from git-scm.com) removes all the need for master naming.
AND provides a initial-branch option for users to set.
you can do this in many many ways...

use init command with param
    git init --initial-branch=main

git aliases
    git config --global alias.new 'init --initial-branch=main'
    git config --global alias.ini '!git init && git symbolic-ref HEAD refs/heads/main'
Problem with this is we cant overwrite git init using an alias...

git config
    git config --global init.defaultBranch main

git function override
    git() { 
        if [[ $1 == "init" ]]; then 
            command git "$@" --initial-branch=main
        else 
            command git "$@" 
        fi
    }

## Node (JS) Reverse a string

    return input.split("").reverse().join("");

## Vim emojis
Emoji List and Unicode Characters
In insert mode do ctrl + v
then type the code and hit ENTER

Website with the list:
https://unicode.org/emoji/charts/full-emoji-list.html

😀 - U1F600
😃 - U1F603
😘 - U1F618
😵 - U1F635
💥 - U1F4A5
💀 - U1F480
✅ - U2705

## Jenkins info
jenkins downloads repos to this folder on the machine...

    /Users/automation/.jenkins/workspace/_____@2/_____

every workspace has 3 type
normla - jenkins file
@2 - the folder
@tmp - rubbish

## Vim close all tabs except for the current one

    :tabon
    (tabonly)

## Tmux equally size panes
CTRL + a ALT + 1 - horizontal (side by side)
CTRL + a ALT + 2 - Vertical (ontop of one another)

## Capture ALL keystrokes in a vim session
use this flag when opening vim (-w {filename}) and it will write all keystokes to the file specificed

    vim -w output

## Material color picker stuff

https://material.io/design/color/the-color-system.html#tools-for-picking-colors
https://material.io/resources/color/#!/?view.left=0&view.right=0&primary.color=df7408&secondary.color=0874df

## Motionlayout helps videos and articles

https://www.youtube.com/watch?v=TcKGOxsrxCM
https://medium.com/@gilgoldzweig/how-to-perfect-android-animations-using-motionlayout-286cfa0f4f13

## Git show specific commit with change
git show just shows the commit info not the changes in the commit
so use the -m flag to see that change in that specific commit

    git show -m <commit_hash>

## Some extra ben videos
https://www.youtube.com/watch?v=kge6D5C_Kpc
https://www.youtube.com/watch?v=78HHdCd-rfc
https://www.youtube.com/watch?v=Jw_7e9styXw
https://www.youtube.com/watch?v=rqlzObyfwQk
https://www.youtube.com/watch?v=p1cpvAPDXYA
https://www.bbc.co.uk/bitesize/articles/zv68cqt
https://www.youtube.com/watch?v=Uwe24ssnqIM
https://www.youtube.com/watch?v=A83Z_e0k3DU

## Auto generate android app icons
https://www.img-bak.in/

## adb full dumpsys command
adb shell dumpsys activity uk.co.very.myvery.dev

## Vim remove lines that DONT contain a pattern
use the g command to find patterns and perform actions on the line
however use the band to invert the pattern search and effect lines
not containing said pattern

    :g!/^\s*"/d

## Vim sort and uniq
use the below command to sort and remove duplicates in a vim file

    :sort u

## preview a bitly link before clicking it
Simply add a '+' to the end of the URL in the browser it will tell you the link it points to.
e.g.

    bit.ly/ABCDE+

## Tmux reminder keys
How to equally space tmux panes

    CTRL + a , ALT + 1 = Equal space Horizontally
    CTRL + a , ALT + 2 = Equal space Vertically

## READ LIST
https://developer.android.com/guide/components/fundamentals#Components

## Mirror android device screen on mac
https://github.com/Genymobile/scrcpy

    brew install scrcpy

## Enables live firebase analytics

    #Start
    adb shell setprop debug.firebase.analytics.app uk.co.very.myvery.dev
    #Stop
    adb shell setprop debug.firebase.analytics.app .none.

On firebase
click debugview
debug device select it and hten enjoy the stream view

## Quicktime screen recording video to gif
https://gist.github.com/dergachev/4627207
Requires:
ffmpeg
gifsicle

    ffmpeg -i in.mov -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > out.gif

Smoother version is this:

    ffmpeg -i dang.mov -s 600x400 -pix_fmt rgb24 -f gif - | gifsicle --delay=5 > out.gif

## install using adb

    adb install <package>

## View shared preferences of debug app
Use the 3 lines below to open adb shell, then run as a specifci DEBUGGABLE package and then you can view the preferences in your app...
https://stackoverflow.com/questions/1243079/how-to-examine-sharedpreferences-from-adb-shell

    adb shell
    run-as <app-package-id>
    cat /data/data/<app-package-id>/shared_prefs/<app-package-id>.xml

Use this to read out to a local file (add > file.txt at end)

    adb exec-out run-as <package> cat /data/data/<package>/shared_prefs/<package>_preferences.xml

Sed works to change the value:

    sed -i "s/ONBOARDING_SHOWN\"\ value\=\"true\"/ONBOARDING_SHOWN\"\ value\=\"false\"/g" <package>_preferences.xml

More adb commands USEFUL:
https://gist.github.com/Pulimet/5013acf2cd5b28e55036c82c91bd56d8

## PS command status options

D Uninterruptible sleep (usually IO)
R Running or runnable (on run queue)
S Interruptible sleep (waiting for an event to complete)
T Stopped, either by a job control signal or because it is being traced.
W paging (not valid since the 2.6.xx kernel)
X dead (should never be seen)
Z Defunct ("zombie") process, terminated but not reaped by its parent.
and the additional characters are:

< high-priority (not nice to other users)
N low-priority (nice to other users)
L has pages locked into memory (for real-time and custom IO)
s is a session leader
l is multi-threaded (using CLONE_THREAD, like NPTL pthreads do)
+ is in the foreground process group 

## Git get who owns the repo
Terminal command to check which github account owns the repo

    git config --get remote.origin.url | cut -d'/' -f4

## Espresso view does NOT exist
Check if a view does NOT EXIST instead of just checking visibility

    check(doesNotExist())


## Git log format string placeholders
Use the below string placeholders in combination with git log's format ability

    git log --format=format:'%H'

    %H: commit hash
    %h: abbreviated commit hash
    %T: tree hash
    %t: abbreviated tree hash
    %P: parent hashes
    %p: abbreviated parent hashes
    %an: author name
    %aN: author name (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %ae: author email
    %aE: author email (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %ad: author date (format respects --date= option)
    %aD: author date, RFC2822 style
    %ar: author date, relative
    %at: author date, UNIX timestamp
    %ai: author date, ISO 8601-like format
    %aI: author date, strict ISO 8601 format
    %cn: committer name
    %cN: committer name (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %ce: committer email
    %cE: committer email (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %cd: committer date (format respects --date= option)
    %cD: committer date, RFC2822 style
    %cr: committer date, relative
    %ct: committer date, UNIX timestamp
    %ci: committer date, ISO 8601-like format
    %cI: committer date, strict ISO 8601 format
    %d: ref names, like the --decorate option of git-log(1)
    %D: ref names without the " (", ")" wrapping.
    %e: encoding
    %s: subject
    %f: sanitized subject line, suitable for a filename
    %b: body
    %B: raw body (unwrapped subject and body)
    %N: commit notes
    %GG: raw verification message from GPG for a signed commit
    %G?: show "G" for a good (valid) signature, "B" for a bad signature, "U" for a good signature with unknown validity, "X" for a good signature that has expired, "Y" for a good signature made by an expired key, "R" for a good signature made by a revoked key, "E" if the signature cannot be checked (e.g. missing key) and "N" for no signature
    %GS: show the name of the signer for a signed commit
    %GK: show the key used to sign a signed commit
    %gD: reflog selector, e.g., refs/stash@{1} or refs/stash@{2 minutes ago}; the format follows the rules described for the -g option. The portion before the @ is the refname as given on the command line (so git log -g refs/heads/master would yield refs/heads/master@{0}).
    %gd: shortened reflog selector; same as %gD, but the refname portion is shortened for human readability (so refs/heads/master becomes just master).
    %gn: reflog identity name
    %gN: reflog identity name (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %ge: reflog identity email
    %gE: reflog identity email (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %gs: reflog subject
    %Cred: switch color to red
    %Cgreen: switch color to green
    %Cblue: switch color to blue
    %Creset: reset color
    %C(...): color specification, as described under Values in the "CONFIGURATION FILE" section of git-config(1); adding auto, at the beginning will emit color only when colors are enabled for log output (by color.diff, color.ui, or --color, and respecting the auto settings of the former if we are going to a terminal).  auto alone (i.e.
    %C(auto)) will turn on auto coloring on the next placeholders until the color is switched again.
    %m: left (<), right (>) or boundary (-) mark
    %n: newline
    %%: a raw %
    %x00: print a byte from a hex code
    %w([<w>[,<i1>[,<i2>]]]): switch line wrapping, like the -w option of git-shortlog(1).
    %<(<N>[,trunc|ltrunc|mtrunc]): make the next placeholder take at least N columns, padding spaces on the right if necessary. Optionally truncate at the beginning (ltrunc), the middle (mtrunc) or the end (trunc) if the output is longer than N columns. Note that truncating only works correctly with N >= 2.
    %<|(<N>): make the next placeholder take at least until Nth columns, padding spaces on the right if necessary
    %>(<N>), %>|(<N>): similar to %<(<N>), %<|(<N>) respectively, but padding spaces on the left
    %>>(<N>), %>>|(<N>): similar to %>(<N>), %>|(<N>) respectively, except that if the next placeholder takes more spaces than given and there are spaces on its left, use those spaces
    %><(<N>), %><|(<N>): similar to % <(<N>), %<|(<N>) respectively, but padding both sides (i.e. the text is centered)


## Android SDK declare
Use this to declare the location of your machine's android sdk location
when running/building new android project especially from the terminal
put this in local.properties to enable your android sdk to be found by gradle

    sdk.dir = /Users/USERNAME/Library/Android/sdk

## At command on Mac
https://apple.stackexchange.com/questions/343110/terminal-how-to-use-at

At command on mac is disabled by default, use the above page to enable it REQUIRES ROOT


## Git branch commits
Get the first commit of brach AFTER it was branched away from its parent

    git log master..branch --oneline | tail -1


## Useful Android LiveData example
This is simply a useful line of code that can be used as an example in viewmodel classes when connecting VM livedata to repo livedata (and in this case flow)

    val prompt: LiveData<PromoPrompt?> = promoRepository.getPromotionPromptData().asLiveData()


## ADB Command to trigger apps with certain intents
PUSH NOTE
This line triggers the specified app (package) whilst firing the specific intent at it
the intent in this case was cased for in the manifest file. This example triggers the 'promotion' intent

Do NOT need to target package if links done correctly...

    adb shell am start -W -a android.intent.action.VIEW -d "myveryapp://home"

Otherwise...

    adb shell am start -W -a android.intent.action.VIEW -d "myveryapp://promotion/abc" uk.co.very.myvery.dev


## Firebase App Distrubution specific fix
Once FB Distro was looking in the wrong place for the apk, so I had to manually tell it, in the app/build.gradle within the FB settings where to look

    apkPath="FullOrRelPathToAPK"


## Nice list of Vim Tips
https://simianwesthighlandterrier.htmlpasta.com/


## Hard coded example of LiveData Android
These lines of code are simple example of a hard coded livedata emitting data

    val prompt : LiveData<PromoPrompt?> = liveData<PromoPrompt?> {
        val pp = PromoPrompt(title = "Discount stuff")
        emit(null)
    }


## Figlet fonts
This command lets you see in the terminal all the fonts that figlet has installed

    showfigfonts


## Gradle Deamon Control
These terminal commands 
    ./gradlew --status
        list running gradle daemons
    ./gradlew --stop
        kill ALL gradle daemons

/Users/ldev507/.gradle/caches/modules-2/files-2.1
    -where gradle stores its dependencies

## curl https://pokeapi.co/api/v2/pokemon
    pokemon api woo

## ffmpeg -i hangouts_message.ogg -f mp3 not.mp3
    convert audio file and all sorts of file to other specific file
    really useful and IMPORTANT

## youtube-dl -x --audio-format mp3 https://www.youtube.com/watch?v=________
    download youtube video as mp3

## adb shell screenrecord /sdcard/vidx.mp4
## THEN CTRL + C when you are done filming
## then adb pull /sdcard/vidx.mp4
    how to record the screen using adb

## perl -pe "s/\e\[[0-9;]*m(?:\e\[K)?//g"
    remove control characters and ansi color codes from string

## brew install translate-shell
## https://www.soimort.org/translate-shell/#getting-started-by-examples
    - translate from german
    trans de: Hallo
    - translate to german
    trans :de hello

## kotlinc kot.kt -include-runtime -d test.jar
## java -jar test.jar
## kotlinc myfile.kt
## javap -c MyfileKt.class  //view the bytecode
    Compile kotlin code to runnable jar

## brew install rename
## rename '/s/abc/___/g' *
    use find and sed patterns to bulk rename files
    even under in deeper sub folders
## find . -name "*offer*" | rename -n 's/_offer-24px\ \(1\)/icon/g'
    dry run will show you what will get renamed
## find . -name "*offer*" | rename 's/_offer-24px\ \(1\)/icon/g'
    actually trigger the rename

## TMUXPREFIX -> :kill-window
    kills entire tmux window

## When bash is invoked as an interactive login shell, or as a non-interactive shell with the --login option, it first reads and executes commands from the file /etc/profile, if
## that file exists. After reading that file, it looks for ~/.bash_profile, ~/.bash_login, and ~/.profile, in that order, and reads and executes commands from the first one that
## exists and is readable. The --noprofile option may be used when the shell is started to inhibit this behavior.
## When an interactive shell that is not a login shell is started, bash reads and executes commands from ~/.bashrc, if that file exists. This may be inhibited by using the --norc
## option. The --rcfile file option will force bash to read and execute commands from file instead of ~/.bashrc
    Interactve bash_profile or bashrc

## for i in {0..100}; do echo $((RANDOM % 20)); done
    print out 100 random numbers between 0 - 20
## echo $(( (RANDOM % 3) + 1))
    generate a random number in bash (1-3)
## echo $((RANDOM % 100))
    0 - 100

## git filter-branch --env-filter '
## OLD_EMAIL="your-old-email@example.com"
## CORRECT_NAME="Your Correct Name"
## CORRECT_EMAIL="your-correct-email@example.com"
## if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
## then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
## fi
## if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
## then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
## fi
' --tag-name-filter cat -- --branches --tags
====>THEN DO THIS
## git push origin --force --all
    update author in all commits REPLACE ben@ben.com
    then second line update all remotes

## VIM German or French
    :digraphs
    CTRL + V then number 
    252 = ü
    246 = ö
    235 = ë
## OR
    CTRL + K then draw it like
    CTRL + K e: = ë
    CTRL + K u: = ü

## find command examples:
## find . -name "*.txt" -exec bash -c 'echo -e "\033[31m {} \033[0m this is a file"' \;

## gpg --full-gen-key
    generate a new key pairing in gpg
## https://www.howtogeek.com/427982/how-to-encrypt-and-decrypt-files-with-gpg-on-linux/
    -gpg
    - hwo to encrypt and decrupt with gpg
    How to GPG
## gpg --list-public-keys
    List all of the public keys on this box
## gpg --list-secret-keys
    List all of the secret private  keys on this box
## gpg --list-keys
     list all public keys in the chain
## gpg --output ~/mykey.key --armor --export ben.kadel@theverygroup.com
    get your public ready for sharing
## gpg --encrypt --armor --sign -r ben.kadel@theverygroup.com <file>
    encrypt the file with the receipient it is intended for
## gpg --decrypt <file>.asc > <outputfile>
    - decrypt the encrypted file
    - works with zip files too

## git stash save -u <message>
    git stash save message and untracked items

## https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/
    - pen test resources lots of commands
    - priv esc

## sed -n 2p
    prints specifically the 2nd line and the 2nd line only

## adb shell am set-debug-app -w --persistent uk.co.very.myvery
## adb shell am clear-debug-app uk.co.very.myvery 
    set the debugger to debug from start on app start
    and to disable it

## docker rm $(docker ps -a -q -f status=exited)
    pruge all for docker 

## export ANDROID_HOME="~/Android"
    set the android sdk in the terminal

## git blame app/src/main/java/com/shopdirect/shop/viewmodel/DepartmentsViewModel.kt  | vim -
    blame file and put in vim

## ssh-keygen -p
    change password on id_rsa
    leave blank to make empty password (REMOVE PASSWORD FROM ID_RSA)

## w3m whatthecommit.com | head -n 1
    get random commit message from awesome site

## while ! ./run.sh; do sleep 1; done
    run the run.sh script until it successfully exectus then stop trying

## git stash show -p > patchfile
## git apply patchfile
    - save stash to patchfile
    - and eventually re apply those chagnes

## ranger
## use V like vim to select files
:bulkrename
## edit
## save and save

## ssh pi@192.168.23.92 'sudo shutdown -r now'
    ssh and send commands

## reimage the ATOM pis
    save the image of one...
    sudo dd if=/dev/sda of=~/atomimage.img
    write to card
    sudo dd if=~/atomimage.img of=/dev/sda bs=16M status=progress
    DONE

## gdate -d "@TIMESTAMP"
    - convert timestamp into date

## ls -a | grep -E "^\."
    view hidden files in dir

## git remote add bitbucket git@bitbucket.org:username/example.git
    add second remote to git repo

## In vim to serach for NOT a pattern
## e.g. lines not start with this pattern
/^#\@!
^ above is finding lines not starting with a #
## the \@! is the important bit

## tldr
    - github repo for terminal command help

/Users/ldev507/Library/Android/sdk/emulator/emulator -list-avds
/Users/ldev507/Library/Android/sdk/emulator/emulator -avd PIXEL_Q
    - list and start emulators from the terminal
    - adb

## Any file in VIM you can use
:%TOhtml 
## and convert it to a cool html file

## readlin -f file
    print file full path


./gradlew testVeryDebug
./gradlew testVeryDebug --tests=CUIViewModelTests.initialValues_test
	- Run single junit test from terminal instead of inside android studio

./gradlew connectedVeryDebugAndroidTest
./gradlew -Pandroid.testInstrumentationRunnerArguments.class=com.shopdirect.unit.onboarding.view.OnBoardingFragmentTests#selectedAMI connectedVeryDebugAndroidTest
./gradlew -Pandroid.testInstrumentationRunnerArguments.class=com.shopdirect.unit.onboarding.view.OnBoardingFragmentTests#test_removeItemSetCorrectly_scrollBackToCorrectOne connectedVeryDebugAndroidTest
 test_removeItemSetCorrectly_scrollBackToCorrectOne(com.shopdirect.unit.onboarding.view.OnBoardingFragmentTests)
    -run specific android test from the terminal
    - this one runs the selectedAMI function from the class AMIJourneyTests
    IMPORTANT

## ls -l `which pip`
## ls -l `which pip3`
    - really useful to see symlinks 

## https://math2001.github.io/post/variable-scopes-vim/
## https://www.gilesorr.com/blog/vim-variable-scope.html
    - vimscript variable scopes

## https://techpatterns.com/forums/about1138.html
    - bash getopts long and short

## for (( c=0; c<$length; c++ ))
## do  
    echo "$c"
## done
    - bash for loop with index and iteration

## git log --full-history -- README.md
    - see full history of file
    - see when file got deleted for example

## du -sh * | sort -h
    - disk usage and sort using human readable variation
    - sort by size

## ssh-keygen
    just on pi for bitbucket ssh key
## ssh-keygen -f ~/atomkey -t rsa -b 4096
    - generate key pair for ssh
    - then copy the .pub into the server and put in authorized keys
    using:
    cat ~/atomkey.pub | ssh pi@192.168.23.92 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys'

## brew --prefix
    /usr/local
## brew info

## git log --all --grep='conditional'
    search git repo for string in commit message

## vim folding in json
:setlocal foldmethod=syntax

## git diff v2.2.0_2435_RC v2.2.1_2439_RC --stat > diffFile
## git diff v2.2.0_2435_RC v2.2.1_2439_RC >> diffFile
	see diffs between two tags git

## pipe output into vim
	echo test | vim -

## git clean -n
	run clean in dry mode, so it wont run it will tell you what files will be effect
## git clean -f 
	do it when ready

## shellcheck file
	- bash lint in the terminal
	- lint check your bash script

## find . -name ".bash*" -delete
	finds and deletes all hidden files starting with bash

## MOUNT HARD DRIVE TO FS --- 
## 1.  look in the /dev folder
    ls -l /dev/disk/by-uuid
## and find the one that is something like sda1 or sdb1 thats your HD
## 2. mkdir /media/usb
## 3. sudo chown -R pi:pi /media/usb
## this chowns the dir with pi as the ownder and as the group
## the -R is recursive for anuthing beneath it.
## 4. sudo mount /dev/sda_ /mount/usb -o uid=pi,gid=pi
## the last bit is options and it sets the user and group to be the specified ones so that you can read and write properly etc...
## 5. to unmount
## sudo umount /media/usb

## sed -i -e 's/a/b/g' -e 's/b/d/g' file
	-multiple string changes find and replace in sed

## ssh -i private_key_file user@ip
	ssh in using a specific key file instead of your private key in .ssh

## https://github.com/onceupon/Bash-Oneliner
	- Very useful! Bash One Liners

## NGINX on my mac default directory
	/usr/local/var/www
	can use nginx -V to find out

## see open ports on machine: ANY OF THESE
	sudo lsof -i -P -n | grep LISTEN 
	sudo netstat -tulpn | grep LISTEN
	sudo lsof -i:22 ## see a specific port such as 22 ##

## type weird characters into vim like 
## windows carriage return thing
	insert mode
	type <CTRL + V> then your char in this case
	<CTRL + M>

## paste into command line in vim
	<CTRL+R>"
	or instead of " whatever buffer you want to use

## Auto format in android studio
	- Command + Option + L

## 256 color for bash
\033[48;5;___m
	-https://misc.flogisoft.com/bash/tip_colors_and_formatting
	256 color on the background

## echo -e "a\nb\nc\nd" | fzf | xargs -I % bash -c 'if [[ "%" == "a" ]]; then echo "rrrr"; fi'
	inline if from fzf with xargs AWESOME

## tmux attach -t "$(tmux ls | fzf | awk '{print $1}' | sed 's/://g')"
	-tmux ls in fzf then open it

## vim $(ls | fzf)
	- open output of fzf into vim

## ls | fzf
	- pipe into fzf
	- it will return the file name on completion

## find . -mtime -1 -maxdepth 1
	- Find files only in this dir that were changed WITHIN the last day
## find . -mtime 1 -maxdepth 1
	- Find files only in this dir that were changed EXACTLY the last day

## echo -e '\U0001F600'
	- https://unicode.org/emoji/charts/full-emoji-list.html
	- echo unicode characters in the terminal

## git show stash@{1}^1
    shows the already tracked files in the repo that have changed
## git show stash@{1}^2
    shows the newly added files in the stash
## git show stash@{1}^3
	- git stash show the untracked portion of the stash
## git stash apply --index
    USE THIS TO APPLY ALL PARTS OF THE STASH
	- UNTRACKED

## find . -type f -maxdepth 1 -exec grep -nl "git fetch" {} \;
	- grep with maxdepth using find

## npm list -g -depth 0
	list npm modules gloabbly and just the parents

## ctags -R .
## ctags -R -f ./.git/tags .
	- use ctags to create ctags first is just where it is
	- second is hidden within the git folder

## g ctrl+a
	- auto increment numbers
	- select not the first number but the second one
	- then select v block to bottom and 
	- g ctl+a
## e.g.
	server-1
	server-2
	server-3
	server-4
	server-5
	server-6

## defaults write -g ApplePressAndHoldEnabled -bool false
	 - To avoid mutliple press on j and k

## https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html
	- IMPORTANT - Bash variables inside of scripts

## local.properties
	- files required for android sdk ANDROID_SDK_ROOT to be set, copy from emar-etc...

## https://jsonplaceholder.typicode.com/
	- JSON placeholder 
	- Free Json api free json rest endpoint

## https://github.com/p-gen/smenu
## https://github.com/2d-inc/developer_quest
## https://github.com/jwiegley/git-scripts
## https://github.com/unixorn/git-extra-commands


## timestamp=$( date +%T )
	- timestamp nice

## Shift+Option+F
	- Mas VSCode vs code visual studio code auto format autoformat code

## array=( one two three )
## for i in "${array[@]}"
## do
	echo $i
## done
	- loop around array in BASH bash for loop array

## echo -e "a \nb \nc" | sort | nl | sed 's/[[:space:]]//g'
	- Bash for echoing sorting adding line numbers and then removing all whitespace

## https://developer.okta.com/blog/2018/08/10/basic-android-without-an-ide
	- Setup android app without IDE

## tmux copy and paste -
	1. Tmux power key : ctrl + a
	2. [
	3. move using arrows to start of text
	4. space bar to enable highlight mode
	5. ENTER
	-
	Now you can paste with ctrl + a then ]

## adb shell am start -W -a android.intent.action.VIEW -d "https://dev106-very.everyday.co.uk"
## adb shell am start -W -a android.intent.action.VIEW -d  "webaddress.co.uk"
	- Use adb to trigger deep links for app without package specified, will trigger disambiguation dialog
	- Android
## Kotlin:
	val abc : (name: String) -> String = { "$name - abcFun" }

#!/usr/bin/env bash
## set -euo pipefail
## IFS=$'\n\t'
	- Bash Strict Mode USE THIS BEN

# unicode "✗"
## readonly fancyx='\342\234\227'
# unicode "✓"
## readonly checkmark='\342\234\223'

## https://dev.to/yashints/let-s-talk-seo-10-tips-you-should-know-4n6k
	- SEO TIPS

## git stash save -u "SAVE_MESSAGE"
	- stash with save message and all untracked files too

> file redirects stdout to file
## 1> file redirects stdout to file
## 2> file redirects stderr to file
&> file redirects stdout and stderr to file
	- redirect output 

\help complete
	- \help (without the alias)
	- builtin command, like complete

## https://stackoverflow.com/questions/40653560/where-are-git-stashes-stored
	- where are git stashes stored...
	- ./git/refs/stash = most recent one
	- ./git/re/bash


## manpath
	- Prints all the places man looks for man pages
	- Also it is mostly /usr/share/man

## View app dependencies
	./gradlew app:dependencies
		- very cool prints graph or tree of all dependencies


//    val p = Paint().apply {
//        color = Color.BLACK
//        style = Paint.Style.FILL
//        textSize = 200f
//    }
}
//TODO
## If the stash wont apply back on
## and you get the 
"could not restore untracked files form stash" error in git
	- git stash show -p | git apply
	- Kind of like the unix diff and patch commands (very cool)

## User adding in terminal:
	useradd -m name
			-m makes home dir
	userdel name
	usermod --shell /bin/bash name

## git mv oldFolderName newFolderName
	- Best way in git to change folder names for a repo
	- https://stackoverflow.com/questions/11183788/in-a-git-repository-how-to-properly-rename-a-directory

## Gradle sync fail with warning.
	- delete .idea folder
	- delete all *.iml files
	- re-import project using new open android studio
	= https://stackoverflow.com/questions/28668252/android-studio-error-unsupported-modules-detected-compilation-is-not-supported

✓ - tick

## NGINX
## nginx
	- Location: /usr/local/var/www
	- Conf:		/usr/local/etc/nginx/nginx.conf
	- Port: 	8080 (std)
	- Load all files:	/usr/local/etc/nginx/servers
	= brew services list
	= brew services start nginx
	= brew services stop nginx


## The Bash Reference manual has a section which attempts to enumerate the differences but some common sources of confusion include

[[ is not available in sh (only [ which is more clunky and limited).
## sh does not have arrays.
## Some Bash keywords like local, source, function, and select are not portable to sh. (Some sh implementations supprt e.g. local.)
## Bash has many C-style syntax extensions like $'string\nwith\tC\aescapes' and the three-argument for((i=0;i<=3;i++)) loop, += increment assignment, etc.
## Bash supports <<<'here strings'.
## Bash has *.{png,jpg} and {0..12} brace expansion.
~ refers to $HOME only in Bash (and more generally ~username to the home directory of username).This is in POSIX, but may be mising from some pre-POSIX /bin/sh implementations.
## Bash has process substitution with <(cmd) and >(cmd).
## Bash has Csh-style convenience redirection aliases like &| for 2>&1 | and &> for > ... 2>&1
## Bash supports coprocesses with <> redirection.
## Bash features a rich set of expanded non-standard parameter expansions such as ${substring:1:2}, ${variable/pattern/replacement}, case conversion, etc.
## Bash has significantly extended facilities for shell arithmetic (though still no floating-point support).
## Many, many Bash-only extensions to enable or disable optional behavior and expose internal state of the shell.
## Many, many convenience features for interactive use which however do not affect script behavior
	- sh vs bash

## docker run -it -v kitty:/shebang bash
	- run persistant docker container
	- docker volume create kitty
			-beforehand
## diff <(grep somestring file1) <(grep somestring file2)
	<() is useful its like $() but lets you re-use the output

## Registers in Vim let you run actions or commands on text stored within them. To access a register, you type "a before a command, where a is the name of a register. If you want to copy the current line into register k, you can type
"kyy
## Or you can append to a register by using a capital letter
"Kyy
## You can then move through the document and paste it elsewhere using
"kp
## To paste from system clipboard on Linux
"+p
## To paste from system clipboard on Windows (or from "mouse highlight" clipboard on Linux)
"*p
## To access all currently defined registers type
:reg

## abd logcat "uk.co.very.myvery.test:*" | grep OkHttp"

## ls -lt  
	- ls sort by date
## while read -r line ; do
	echo "$line"
## done < <(echo -e "abc \n def \n poi \n 123")
	- Loop round each line of output result from previous command

## git log | grep -E "Merged in MAS-8.."
	- check git log for merged in items starting with 8
## du -shc *
	- measure all items in folder with disk usage including a total -c
## tmux -
	<prefix> + % - make new pane to side
	<prefix> + " - make new pane below
	<prefix> + t - shows time in current pane
	<prefix> + c - creates a brand new window
	<prefix> + z - toggles zoom of pane, temp fullscreen 'Z' in bar to show zoomed
	<prefix> + f - find panes in find view
	<prefix> + d - detach from session
	<prefix> + p - switch between windows in current session
	https://gist.github.com/MohamedAlaa/2961058
## read var
	- echo "$var" 
	- user input

## echo "abcd" | shasum -a 512
	- shasum checksum
## sudo osascript -e "set Volume 0"
	- set mac volume to 0

## git diff-tree --no-commit-id --name-only -r bd61ad98
	- Nice way of seeing the actual modifications to files in git commit
	- M A D etc...

## RX Help-
## Map - Receives each emission of the Obs and changes the format of data, so transform item bu applying a function to each item.
## Just - Just emit this one thing as a stream
## Filter - disposes of some information, it filters, based on the preds
## Subject - liek a observable 
## Scan - takes 2 params, basically eits an initial value applies a function to that vlue
## CombineLatest
## zip - only emits when has pair of data
## distinct - no repeting values
## delaySubscription - VERY different from delay
## takeutil - do observerable emmision until another observable fires
## interval - outputs at a rate and outputs a counting number
## distinctUntilChnaged - for basically checked last thing isnt the same as this emitting
## throttleFirst - add a time throttle to stream ignoring things outside fo the time zone
## retry() - number of times to retry plus predicate for saying "when this is ok do a retyr"

## adb shell am start -W -a android.intent.action.VIEW -d "https://play.google.com/store/apps/details?id=uk.co.very.myvery"
	- -W is wait for launch to complete
	- -d is the data
	- -a is the action
	- Fire implicit intent into device

## MACOS - pmset -g batt
	- Gets battery power for mac os

## http://www.endmemo.com/unicode/unicodeconverter.php
	- awesome converter for ascii, unicode, hex character

## echo "█" | hexdump
	- then take the 3 bits before the 0a
	and put into echo -e '\x__\x__\x__'
	block is: E2 96 88 
	echo -e '\xE2\x96/x88' 

## gx
	- in vim opens links
	OMG

## if [[ "$locationOfBuild" =~ .*".apk".* ]]; then
	- regex if statement with bash

## git diff -- **/REGEX*
	: Git diff without the full path to the file		

## python -m pip install <package>
	- Use python 3 to install with pip (multiple python versions)

## ln -s original new_file
	-Symbolic link

## g++ -std=c++11
	- use c++ 11 specifically

## git squash !!! VERY IMPORTANT
	- git squashing is done as follows
## git rebase -i HEAD~n
## e.g. git rebase -i HEAD~3  = = squash last 3 commits (can also use a hash)
## then in editor keep the top (oldest) one to be pick and edit the others to be squash
## save and close then the second editor appreance will ask about the commit message
## use the provided space to delete the combined messages and your own (otpional)
	- git rebase -i HEAD~3

## Bash string manipulation cheatsheet
## Assignment
## Assign value to variable if variable is not already set. Value will be returned.

## Couple with : no-op if return value is to be discarded.	${variable="value"}
: ${variable="value"}
## Removal
## Delete shortest match of needle from front of haystack	${haystack#needle}
## Delete longest match of needle from front of haystack	${haystack##needle}
## Delete shortest match of needle from back of haystack	${haystack%needle}
## Delete longest match of needle from back of haystack	${haystack%%needle}
## Replacement
## Replace first match of needle with replacement from haystack	${haystack/needle/replacement}
## Replace all matches of needle with replacement from haystack	${haystack//needle/replacement}
## If needle matches front of haystack replace with replacement	${haystack/#needle/replacement}
## If needle matches back of haystack replace with replacement	${haystack/%needle/replacement}
## Substitution
## If variable not set, return value, else variable	${variable-value}
## If variable not set or empty, return value, else variable	${variable:-value}
## If variable set, return value, else null string	${variable+value}
## If variable set and not empty, return value, else null string	${variable:+value}
## Extraction
## Extract length characters from variable starting at position	${variable:position:length}
## String length of variable	${#variable}
	- String manipulation

## echo "3.3/4.2" | bc -l
	- gives output of decimal calculation in long format
	- echo "scale=2; 100/3" | bc
			-gives output to 2 dp

## find . -name "*.apk"
	- find from this folder down an apk

## if [[ ! -z "$var" ]]; then
	// --if variable is not empty !
## fi

## grep -r "pattern" 
	- searches for string in folder and all files.

## echo "test" | shasum -a 256
	- ALSO WITH FILE: shasum {file} -a 256    ... takes a little longer

## C++ compiling issue
## symbole errors in arch
	- gcc main.cpp -o main -lstdc++
	- OR just use
	- g++ main.cpp -o main

## Add just untracked files
	- git add -i
	- followed by a, followed by *, followed by q
	- git stash --include-untracked  is awesome too

## gradle init --type=kotlin-application
	- set up a kotlin application

:%s/foo/bar/g
## Find each occurrence of 'foo' (in all lines), and replace it with 'bar'.
:s/foo/bar/g
## Find each occurrence of 'foo' (in the current line only), and replace it with 'bar'.
:%s/foo/bar/gc
## Change each 'foo' to 'bar', but ask for confirmation first.
## Also use 'a' for yes to ALL
## FINALL you can use regex
:%s/[a-z]/t/gc
	- find and replace

## git push origin --delete BRANCH_NAME
	-delets branch from remote

## git stash save "Specifc note or message"
	- saves stash with specific tag
## git stash list
## git stash show stash@{1}
## git stash show -p stash@{1}
	- show with diffs
## git stash clear
	- deltes all stash

## sudo ifconfig en0 up
## sudo ifconfig en0 down
	- Turn wifi on and off for things
	- pi uses wlan0 instead

## kill %1
	-kill bg job number 1

## SHIFT + OPTION + F     - VSCode Auto Format

## docker rm $(docker ps -a -q)
	- Removes all docker containers
	- allows name reuse etc...

## zip and unzip
	- encrypt file
		= zip -e DESTINATION file_or_folder
	- decrypt
		= unzip ZIPPED_FILE
	- folder
		= zip -er DEST folder

!:1
	- gets the first arguement from the last command
	- e.g. !:3 gets the 3rd arguement from the last command


## adb shell settings put global window_animation_scale 0.0
## adb shell settings put global transition_animation_scale 0.0
## adb shell settings put global animator_duration_scale 0.0
	- Set animations to off...
	- DOESNT WORK forget it

## curl cheat.sh
## curl cheat.sh/bash/while+loop
	- loads bash cheatsheet 
	- find specific queries about language
 echo -e '\x2f'
 	- echos out using hex value (hexdump -C)
 
 adb shell pm list package -3 | grep vector | cat -vet
 	- See its carriage return at the end ^M
	- use: to remove
	tr -d '\r'
 
 while read -r line; do
    printf '%s\n' "$line"
## done < "file"
	- read over the contents of a file line by line

 grep -nrI 'ben' .
	- -I is ignore binary files
 	- looks a in directory for a specific word
	- and displays line number and recursively seraches down too
 
 ./repeat &>templog &
 	- run process in background and pipe output to a file
	- can also be to /dev/null
	- You can use fg 1 to get back the process to the foreground
 
 trap function_name SIGINT
 or
 trap function_name 1 2 3 6
 	- traps interupts and triggers function
	- function must be declared before hand and also include an exit
 
 https://stackoverflow.com/questions/11880070/how-to-run-a-script-as-root-in-jenkins
 	-Jenkins and Sudo

 curl -H "Content-Type:application/json" -X POST -d '{"name":"ben"}' http://rest.learncode.academy/api/timber/gather
 	- Awesome free json API tester..
	-with curl .
 
 #!/bin/bash
## input="/path/to/txt/file"
## while IFS= read -r var
## do
  echo "$var"
## done < "$input"
	- Read in a file line by line
 
 rm file || { echo 'Could not delete file!' >&2; exit 1; }
 	- Safe rm with exit code example

## grep -R "Hello World" *
## grep -rn . -e "Hello World"
	- Search all files in this dir for a string

## if [[ $PATH =~ "ben" ]]; then echo "yrs"; else echo "no"; fi
	- if path contains link to ben_scripts
	- regex bash if statement

## https://github.com/chubin/cheat.sh
	- Ultimate programming cheat sheet
	- e.g.
	- curl cheat.sh/js/1line
	- curl cht.sh

## ln -s ../Documents/bashfun/scopeTest scopeHelper
	- create a symbolic link the left exists already
	- the right is a brand new file

## http://www.falstad.com/circuit/circuitjs.html
	- Amazing electronics online tester

## set -x
## BASH CODE
## set +x
	- sets tracing in bash
	- ALSO export PS4='$LINENO + ' (PS4 is the tracing)

{} - number of times
	- '^[0-9]{3}' = 3 nums in row
? - zero or one
* - zero or more
+ - one or more
	regex tip

## 2>
	writes errors to somewhere
## 2> /dev/null
	writes errors to null
>&2
	- writes to stderr

## printf '   dfsdfds \n'
	 - uses the new line correctlu
	 - use '"'"' these 5 characters in the case of escaping a single quote

## var out = "";
$("[data-clipboard-text]").each(function(){
			var orte = this.innerText;
				var name = orte.replace("COPY","");
					var col = this.getAttribute("data-clipboard-text");
						console.log(name + " : " + col);
							out += name + " : " + col + "\n";
});
## console.log(out);
	- Went to a website and scrapped out the names of colour and the colour code iteself

/* 
## RED : #F44336
## PINK : #E91E63
## PURPLE : #9C27B0
## DEEP PURPLE : #673AB7
## INDIGO : #3F51B5
## BLUE : #2196F3
## LIGHT BLUE : #03A9F4
## CYAN : #00BCD4
## TEAL : #009688
## GREEN : #4CAF50
## LIGHT GREEN : #8BC34A
## LIME : #CDDC39
## YELLOW : #FFEB3B
## AMBER : #FFC107
## ORANGE : #FF9800
## DEEP ORANGE : #FF5722
## BROWN : #795548
## GREY : #9E9E9E
## BLUE GREY : #607D8B
*/
	- web colours , material colours

## adb shell input keyevent KEYCODE_WAKEUP
	- Wake up sleeping andorid phone

## sh jirase.sh | jq '.issues[0].key'
## GET JSON | jq '.total'
	- e.g. { total: 6, other: 5} = 6

## throw new RuntimeException("This is a crash");
	- java throw specific exception

\ls
	- runs ls without alias
	- use the back slash to run any command without alias

## find . -name "*20180510*" -exec cp {} test \;
	- find all files with that name and carries out
	- exec command of cp {} - means each file
	- and the \ means one at a time, a + would be all at once

## USE purgeGits followed by git fetch -p
	-cleans up all local branches followed by removing remote trackers for branches that dont exist

~/Documents/xhr.js
	- Contains example request without jquery

## CMD+SHIFT+v   in VSCode for HTML preview
## CMD+K V		  in VSCode for side preview
## SHIFT+OPTION+F in VSCode to auto format JSON

## git checkout HEAD^
	- get previous commit active
## git checkout master
	- fix dettached head

## kotlinc main.kt
## kotlin MainKt
	- compile and run kotlin code

## open -a "Google Chrome" index.html 
	- open google chrome with this file
## open -a /App.... http://www.bbc.co.uk
	- open chrome to site

## gron version.json | grep nickname | sed 's/.*"\(.*\)".*/\1/'
	- grons out the json to greppable stdout, grep to get the field wanted
	 then the sed to get the data between the speech marks

## git checkout -- data/file.java
	- brings back the version of the file before the changes you have saved
		- so the version of the file that exists in the last commit
		- works with HEAD^ for commit before last

## git diff HEAD^ HEAD file_name.c
	- compare this commit with last commit version of file

## git stash
## git checkout branch123
## git stash apply
	- working on wrong branch, stash change and apply


## git reset --hard HEAD^
	- rollbacks by one commit and deletes the changes
## git reset --soft HEAD^
	- rollbacks by one commit and keeps changes staged


<p>curl 'https://donjon.bin.sh/name/rpc.cgi?type=Elf+Male&n=10' -s | head -n 1

	- curl donjon and get top answer

## npx mocha test/utilsTest.js
	- runs single file through the test

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
	- font awesome icons rel link

## apt list --installed
	-list all installed apts

## xargs
	 - lets you use STDout and pipe into programs like, rm, mkdir, echo and chmod
	- e.g. 			ls | xargs chmod 777

"CMD + SHIFT + ."
	- toggles visibility of hidden files and folders 

## echo "test test test " | lolcat -F 0.5
	- enjoy the rainbow

## start a mysql daemon with
    mysqld
## then when its running connect with
    mysql -h localhost -u root
## use these commands:
    show databases;
    use DB
    show tables;
## use kill command to kill deamoon nicely after
	- Mysql terminal
## alter table atom add COL_NAME COL_TYPE [not null default VAL]
## alter table atom drop COL_NAME
## update atom set COL_NAME = VAL where Email = 'balh'

    Create a database
## CREATE DATABASE testdb;
## https://www.mysqltutorial.org/mysql-create-database/

    Add a new MYSQL User
## CREATE USER 'newuser'@'%' IDENTIFIED BY 'user_password';
    % - any machine
    IP_ADD - from this ip address
    localhost - this specific machine
## https://linuxize.com/post/how-to-create-mysql-user-accounts-and-grant-privileges/

    Grant privilages to user...
## GRANT permission1, permission2 ON database_name.table_name TO 'database_user'@'localhost';
## GRANT ALL PRIVILEGES ON database_name.* TO 'database_user'@'localhost';
## https://linuxize.com/post/how-to-create-mysql-user-accounts-and-grant-privileges/

    Change MYSQL User password
## ALTER USER 'user'@'hostname' IDENTIFIED BY 'newPass';
## https://www.cyberciti.biz/faq/mysql-change-user-password/



## sample='[{"name":"foo"},{"name":"bar"}]'
## echo "${sample}" | jq -c '.[]'
	- JQ to read JSON in terminal

## echo $PROMPT_COMMAND
	- get commands run after every command
	- for now its just : update_terminal_cwd

## nvm alias default v8.7.0
	- set node version to default at 8.7.0

## require.resolve('jsen')
	- find the path of a node module

## node node_modules/nyc/bin/nyc.js report --reporter=html
	- Run npm module that is only installed locally
	- node LOCATION/module.js  . . . . 

## php -S 127.0.0.1:8080
	-PHP version of in-built web server
## python -m SimpleHTTPServer 8000
	- simple web server using python
## python -m http.server 1337
	- simple web server PTYHON 3+
## npm install http-server -g
## http-server ./[yourfolder] -p 1337
	- Node simple web server

## kotlinc nameOfFile.kt ... ... then
## kotlin NameOfFile   (without kt, (.class))
	- to compile and run kotlin in command line

## curl -X POST "http://localhost:3000/hello"
	- curl with post request
	(nodemon index.js)

## npm list --depth=0 -g
	- npm print list of packages globally with depth 0 V Useful

## open -a /Applications/Sublime\ Text.app/ ~/Desktop/todo_detailed
	- ON MACOS open application , sublime with file

## for (( c=0; c<=$length; c++ ))
## do
	echo "$c"
## done
	- proper for loop using variable as length

## for i in {16..21} {21..16} ; do echo -en "\033[48;5;${i}m \033[0m" ; done ; echo
	- display cool deeping blue effect

## htpasswd -c .htpasswd cliff
	- make new htpasswd file containing clif

    https://www.edureka.co/blog/java-tutorial/?utm_source=quora&utm_medium=crosspost&utm_campaign=social-media-edureka-april-aj
- TEACH OOP LINKS
    https://www.edureka.co/blog/object-oriented-programming/?utm_source=blog&utm_medium=left-menu&utm_campaign=java-tutorial


## echo "sam.bob.ben.cat" | awk -F'.' '{print$3}'
	- awk and prin the 3rd split element

## cat -vet file
	- display true contents of a file, special characters

## tr -d '\b\r' < your_file
	- delete carriage returns and backspaces from windows incoming file

~$find . -name webscrap* -maxdepth 2
	- from ~find the file in Desktop/

## git branch -m new_name
	- rename the current branch

## grep -rn . -e 'promot'
	- use grep to find in all files in dir a specifc pattern

## git checkout -b LocalName origin/remotebranchname
	- makes a local branch of a remote branch
## OR
## git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
	- pulls all remote branches into local tracking branches


## git config color.ui true
	- sets git to use colours properly

## git log  --stat
## git log --pretty --oneline --graph
	- display the proper graph of the git log nicely with lines and colours

## Really important files located in the bashfun/ folder
	- makeUsers and delTrainingUsers (creates and deletes users)

## git stash list
	- List the stashes

## git stash drop stash@{n}
	- drops deletes a specific git stash

## echo "$-"
## if [[ $- == *i* ]] ;
## then
  echo "intercact"
## fi
	- Displays and checks if the shell is interactive:
		H - histexpand
		m - monitor
		h - hashall
		B - braceexpand
		i - interactive

## adb shell screencap -p /sdcard/screen.png
## adb pull /sdcard/screen.png
	- screenshot phone and takes fill from shell

## while getopts u:d:p:f: option
## do
 case "${option}"
 in
 u) USER=${OPTARG};;
 d) DATE=${OPTARG};;
 p) PRODUCT=${OPTARG};;
 f) FORMAT=$OPTARG;;
 esac
## done
	- passing in parameters to a script

## LS_COLORS:
## a black
## b red
## c green
## d brown
## e blue
## f magenta
## g cyan
## h light grey
## A bold black, usually shows up as dark grey
## B bold red
## C bold green
## D bold brown, usually shows up as yellow
## E bold blue
## F bold magenta
## G bold cyan
## H bold light grey; looks like bright white
## x default foreground or background

## first char is foreground
## 2nd is background
## executable - hb    grey and red

## 1.   directory
## 2.   symbolic link
## 3.   socket
## 4.   pipe
## 5.   executable
## 6.   block special
## 7.   character special
## 8.   executable with setuid bit set
## 9.   executable with setgid bit set
## 10.  directory writable to others, with sticky bit
## 11.  directory writable to others, without sticky bit


## echo $SHELL
!^      first argument
!$      last argument
!*      all arguments
!:2     second argument

!:2-3   second to third arguments
!:2-$   second to last arguments
!:2*    second to last arguments
!:2-    second to next to last arguments

!:0     the command
!!      repeat the previous line

/boot – Where the boot image files are stored
/mnt – The mount points for the partitions
/dev – Files of all the connected devices (USB, Printers)
/proc – Dynamic process information
/sys – Dynamic system configuration information
/var – Log files and system subdirectories
/tmp & /spool – Temporary files
/home – User accounts home directories
/usr & /user/local – A replicate tree for users and contains administrative tools
/bin & /sbin – Essential system executable files
/etc – System configuration files
/share – Common read only files
/lib & /include – Shared library files and system development

## https://www.tutorialspoint.com/unix/unix-file-system.htm

## For a file :

## r = we can see the content of the file

## w = we can modify the content

## x = we can run the file using command "./<fileName>"

## For a directory :
(You need read and exe permissions to enter a folder)
## r = we can see contents of the directory

## w = we can write files in a directory

## x = we can use "cd <dirName>" command to enter into the directory

## bashprofile
## When you login (type username and password) via console, either sitting at the machine, or remotely via ssh: .bash_profile is executed to configure your shell before the initial command prompt.

## INFO FOR PS1
## bashrc
## But, if you’ve already logged into your machine and open a new terminal window (xterm) then .bashrc is executed before the window command prompt. .bashrc is also run when you start a new bash instance by typing /bin/bash in a terminal.
\a : an ASCII bell character (07)
\d : the date in “Weekday Month Date” format (e.g., “Tue May 26”)
\D{format} :	the format is passed to strftime(3) and the result is inserted into the prompt string; an empty format results in a locale-specific time representation. The braces are required
\e : an ASCII escape character (033)
\h : the hostname up to the first ‘.’
\H : the hostname
\j : the number of jobs currently managed by the shell
\l : the basename of the shellâ€™s terminal device name
\n : newline
\r : carriage return
\s : the name of the shell, the basename of $0 (the portion following the final slash)
\t : the current time in 24-hour HH:MM:SS format
\T : the current time in 12-hour HH:MM:SS format
\@ : the current time in 12-hour am/pm format
\A : the current time in 24-hour HH:MM format
\u : the username of the current user
\v : the version of bash (e.g., 2.00)
\V : the release of bash, version + patch level (e.g., 2.00.0)
\w : the current working directory, with $HOME abbreviated with a tilde
\W : the basename of the current working directory, with $HOME abbreviated with a tilde
\! : the history number of this command
\# : the command number of this command
\$ : if the effective UID is 0, a #, otherwise a $
\nnn : the character corresponding to the octal number nnn
\\ : a backslash
\[ : begin a sequence of non-printing characters, which could be used to embed a terminal control sequence into the prompt
\] : end a sequence of non-printing characters
