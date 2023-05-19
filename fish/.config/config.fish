if status is-interactive

    function cloud
        set user $HOME
        cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/
    end

    function docs
        set user $HOME
        cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents
    end

    function downloads
        set user $HOME
        cd $HOME/Downloads
    end

    function desktop
        set user $HOME
        cd $HOME/Desktop
    end

    function notebook
        jupyter-notebook
    end
end
