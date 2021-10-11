#! /bin/bash
VERSION="V0.1.0"
FOLDER="/home/$USER/.config/awesome/themes/default"
CFG="$(pwd)/default"

while [ -n "$1" ]
do
    case $1 in
        "help"|"--help")
            echo -ne "\
This script manages config files of Awesome wm.\n\
./setup.sh [OPTION]\n\

install \t \t copy all configs into home directory\n\
update  \t \t copy all configs from home directory to this folder\n\
info    \t \t watch information about config\n\
"
        ;;

        "install")
            mkdir -p $FOLDER 2> /dev/null
            cp -rv awesome/* -t $FOLDER
            echo $(pwd) > curr_dir
        ;;

        "update")
            cp -urv $FOLDER/*.lua $CFG/
        ;;

        "info")
            echo -ne "\
My Awesome theme $VERSION\n\
"
        ;;

    esac

    shift
done
