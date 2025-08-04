# APP=$(wofi --insensitive --show drun)
# [ -n "$APP" ] && "$APP"


APP=$(wofi --show drun --define=drun-print_desktop_file=true | sed -E 's/\.desktop( )?$/\.desktop:/')
[ -n "$APP" ] && uwsm app -- "$APP"
