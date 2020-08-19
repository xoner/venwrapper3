# My virtualenvwrpper for python3
VENVS_HOME="HOME/.virtualenvs3/"

function workon () { 
    if [ -z "$1" ]; then
        echo "No virtualenv specified, you must specify one."
        echo "Usage: "
        echo "\t workon venv_name"
        exit 1
    fi

    source $HOME/.virtualenvs3/$1/bin/activate
}

function mkvirtualenv () {
    if [ -z "$1" ]; then
        echo "No new virtualenv name specified, you must specify one."
        echo "Usage:"
        echo "\t mkvirtualenv new_venv_name"
        exit 1
    fi
    
    python3 -m venv $HOME/.virtualenvs3/$1
}

function lsvirtualenvs () { 
    ls $HOME/.virtualenvs3
}
function rmvirtualenv () {
    if [ -z "$1" ]; then
        echo "No virtualenv specified to be deleted."
        echo "Usage:"
        echo "\t rmvirtualenv venv_name"
        exit 1
    fi
    
    rm -rf $HOME/.virtualenvs3/$1
}

function _workon {
    _values 'virtualenvs' "${(f)$(ls ~/.virtualenvs3/)}"
}

function _rmvirtualenv {
    _values 'virtualenvs' "${(f)$(ls ~/.virtualenvs3/)}"
}

compdef _workon workon
compdef _rmvirtualenv rmvirtualenv
