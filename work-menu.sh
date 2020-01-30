openEmacs() {
    #!/usr/bin/env zsh
    # Checks if there's a frame open
    emacsclient -n -e "(if (> (length (frame-list)) 1) ‘t)" 2> /dev/null | grep t &> /dev/null
    if [ "$?" -eq "1" ]; then
        emacsclient -a ‘’ -nqc "$@" &> /dev/null
    else
        emacsclient -nq "$@" &> /dev/null
    fi
}

case $(~/.happy-desktop/bin/prompt -o "emacs,e-mail (personal),calendar,focus browser,distraction browser,spotify,irc,notion" -q "λ") in
    'emacs')
        openEmacs
        ;;
    'e-mail (personal)')
        chromium --app="https://mail.superhuman.com" --profile-directory="Default"
        ;;
    'e-mail (work)')
        ~/localbin/open-url "https://mail.google.com/mail/u/0/#inbox" "Profile 3"
        ;;
    'calendar')
        ~/localbin/open-url "https://calendar.google.com/calendar/b/0/r" "Profile 3"
        ;;
    'focus browser')
        chromium --profile-directory="Profile 3"
        ;;
    'distraction browser')
        chromium --profile-directory="Default"
        ;;
    'spotify')
        spotify
        ;;
    'irc')
        alacritty -e irssi
        ;;
    'notion')
        ~/localbin/open-url 'https://notion.so'
        ;;
esac
