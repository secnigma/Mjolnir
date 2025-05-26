#!/usr/bin/env bash
# Inspired by @breadonpenguins `dmenu_notes` script

folder=$HOME/snippets/

pick_snippet () { \
  name="$(echo "" | dmenu -sb "#a3be8c" -nf "#d8dee9" -p "Enter a name: " <&-)" || exit 0
}

send_notification () {
  message="${1:-Done}"
  icon="/usr/share/icons/gnome/32x32/actions/edit-paste.png"
  notify-send -e -i $icon "$message"
  
}

copy_to_clipboard () { 
  cat "$folder$choice" |xclip -selection clipboard && send_notification "Copied to clipboard!"
}


selected () { \
  choice=$(echo -e "New\n$(command ls -t1 $folder)" | dmenu -l 5 -i -p "Choose note or create new: ")
  case $choice in
    New) pick_snippet ;;
    *.sh) copy_to_clipboard ;;
    *) exit ;;
  esac
}

selected
