
# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

if [ -x ~/svn.ppops.net ]; then
    . ~/scripts/local_include
    . ~/scripts/export_variable_for_inventory_cli
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,aliases,functions,helpers,path,extra,exports}; do
    [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

export PS1="\[\e[1;32m\]\u@\H:\[\e[0m\]\[\e[1;36m\]\w\[\e[0m\]\n\[\e[1;32m\]\t->\[\e[0m\]"

SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
  eval `$SSHAGENT $SSHAGENTARGS`
  trap "kill $SSH_AGENT_PID" 0
fi
### START-Keychain ###
/usr/local/bin/keychain $HOME/.ssh/id_rsa
source $HOME/.keychain/$HOSTNAME-sh
### End-Keychain ###

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kbonthu/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/kbonthu/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kbonthu/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/kbonthu/Downloads/google-cloud-sdk/completion.bash.inc'; fi

#source "`brew --prefix grc`/etc/grc.bashrc"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[[ -e "$HOME/.ssh/config" ]] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

