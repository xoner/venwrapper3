# My virtualenvwrpper for python3
VENVS_HOME="HOME/.virtualenvs3/"

function workon () { 
 source $HOME/.virtualenvs3/$1/bin/activate }
function mkvenv3 () { python3 -m venv $HOME/.virtualenvs3/$1 }
function mkvenv37 () { python3.7 -m venv $HOME/.virtualenvs3/$1 }
function lsvenv3 () { ls $HOME/.virtualenvs3 }
function rmvenv3 () { rm -rf $HOME/.virtualenvs3/$1 }

function _workon3 {
    _values 'virtualenvs' "${(f)$(ls ~/.virtualenvs3/)}"
}

function _rmvenv3 {
    _values 'virtualenvs' "${(f)$(ls ~/.virtualenvs3/)}"
}

compdef _workon3 workon3
compdef _rmvenv3 rmvenv3
