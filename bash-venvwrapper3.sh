#/usr/bin/env bash

VENVS_HOME="$HOME/.virtualenvs3"

if [ ! -d "$VENVS_HOME" ]; then
    echo "Home of virtualenvs does not exists, creating it"
    mkdir $VENVS_HOME
fi

workon() {
    if [ -z "$1" ]; then
        echo "No virtualenv specified"
        exit 2
    fi

    source $VENVS_HOME/$1/bin/activate
}

mkvirtualenv() {
    if [ -z "$1" ]; then
        echo "No new virtualenv name specified, you must specify one"
        exit 2
    fi

    python3 -m venv $HOME/.virtualenvs3/$1
}

rmvirtualenv() {
    if [ -z "$1" ]; then
        echo "No virtual env specified to delete."
        exit 2
    fi

    rm -rf $VENVS_HOME/$1
}

lsvirtualenvs() {
    ls $VENVS_HOME
}

_venvs_completions() {
    DIR_LIST=$(ls $VENVS_HOME)

    COMPREPLY=($(compgen -W "$DIR_LIST" "${COMP_WORDS[1]}"))
}

complete -F _venvs_completions workon
complete -F _venvs_completions rmvirtualenv
