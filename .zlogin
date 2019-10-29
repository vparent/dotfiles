echo -e "Available window manager session:\n\t1 - KDE Plasma 5\n\t2 - Openbox window manager\n\t3 - i3-gap Tiling WM\n"
echo -e "Enter the number corresponding to the desktop session or s for shutdown, r for reboot, anything else\n"
echo "will start a console session";

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
    *)
        logger "User: $USER Starting console session"
        ;;
esac

if [[ ! -z $session ]] 
then
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx $session -- vt7
fi
