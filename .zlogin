if ! [[ $TMUX || $SSH_CLIENT ]]
then
    echo -e "Available window manager session:\n\t1 - KDE Plasma 5\n\t2 - Openbox window manager\n\t3 - i3-gap Tiling WM\n"
    echo -e "Enter the number corresponding to the desktop session or s for shutdown, r for reboot"
    echo -e "If nvidia-xrun is usable on the system, press n to start a desktop session with it"
    echo "any other key will start a console session";

    read nb_sess;

    case $nb_sess in
        '1')
            logger "User: $USER Starting KDE plasma session"
            session="kde"
            ;;
        '2')
            logger "User: $USER Starting Openbox session"
            session="openbox"
            ;;
        '3')
            logger "User: $USER Starting i3 session"
            session="i3"
            ;;
        's')
            /usr/bin/shutdown -h now
            ;;
        'r')
            /usr/bin/reboot
            ;;
        'n')
            [[ -f /usr/bin/nvidia-xrun ]] && echo -n "Enter a desktop session number: "; read nb_nsess;
            if [ -f /usr/bin/nvidia-xrun ]
            then
                case $nb_nsess in
                    '1')
                        nsession=/usr/bin/startplasma-x11
                        ;;
                    '2')
                        nsession=/usr/bin/openbox-session
                        ;;
                    '3')
                        nsession=/usr/bin/i3
                        ;;
                    's')
                        /usr/bin/shutdown -h now
                        ;;
                    'r')
                        /usr/bin/reboot
                        ;;
                    *)
                        ;;
                esac
            fi
            [[ -f /usr/bin/nvidia-xrun ]] && /usr/bin/nvidia-xrun $nsession
            ;;
        *)
            logger "User: $USER Starting console session"
            ;;
    esac

    if [[ ! -z $session ]] 
    then
        [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx $session;
    fi
fi
