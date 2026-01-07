## Betterlockscreen
#/usr/bin/betterlockscreen -l dim --display 1 --off 600
# betterlockscreen --update ~/.wallpaper/background3.jpg --display 1 --off 600 --fx blur,dim --dim 30 --blur 0.5 --desc "lockscreen"

# i3Locks

BLANK='#00000030'
CLEAR='#ffffff22'
DEFAULT='#00897bE6'
TEXT='#00897bE6'
WRONG='#880000bb'
VERIFYING='#00564dE6'

i3lock \
--nofork \
--lock-text="Locking..." \
--noinput-text="Empty" \
--wrong-text="Try again" \
--verif-text="Verifying..." \
\
--radius=150 \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=00000060        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--screen 1                   \
--clock                      \
--indicator                  \
--color=$BLANK \
--time-str="%H : %M : %S"        \
--date-str="%A, %Y-%m-%d"      # \
#--keylayout 1                

#--blur 9                     \
