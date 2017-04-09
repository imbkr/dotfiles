# .bashrc

if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export SVNROOT='/Users/kbonthu/svn.ppops.net'
export GITLAB='/Users/kbonthu/puppet-repo'
export GITPROD='/Users/kbonthu/prod-repo/puppet-repo'


PATH="/Users/kbonthu/perl5/bin${PATH:+:${PATH}}";
PATH=$PATH:/Users/kbonthu/repos/puppetng/administration-tools/bin;
PERL5LIB="/Users/kbonthu/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/kbonthu/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/kbonthu/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/kbonthu/perl5"; export PERL_MM_OPT;

export PATH;

