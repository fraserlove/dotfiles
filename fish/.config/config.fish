if status is-interactive

    function cloud
        set user $HOME
        cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/
    end

    function docs
        set user $HOME
        cd $HOME/Documents
    end
end

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

set -gx LDFLAGS (brew --prefix openssl)/lib
set -gx CPPFLAGS (brew --prefix openssl)/include
set -gx LDFLAGS "-L/usr/local/opt/zlib/lib"
set -gx CPPFLAGS "-I/usr/local/opt/zlib/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig"
