#! /bin/bash

tempfile=`(tempfile) 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 $SIG_NONE $SIG_HUP $SIG_INT $SIG_QUIT $SIG_TERM

resp=0

until [ "$resp" = "Quit" ]
do
    next=$(($resp + 1))
    if [ $next = "11" ]; then
        next="Quit";
    fi

    menu = "Pour effectuer un calibrage, tapez (c) \n"\
            "Pour afficher les instructions, tapez (i) \n"\
            "Pour commencer, tapez (e) \n"\
            "Pour quitter, tapez (q) \n"

        choix_session = "Choix de la session \n"\
                "Session 1, tapez (1) \n"\
                "Session 2, tapez (2) \n"\
                "Session 3, tapez (3) \n"\
                "Session 4, tapez (4) \n"


#<width-of-box> <top-of-box> <number-of-options-visible>

    dialog --clear --title "Localizer standart" "$@" \
         --nocancel --default-item  "$next" \
         --menu "Sélectionner votre choix et appuyer sur entrée\n" \
             24 40 7 \
             1 "Effectuer un calibrage" \
             2 "Afficher les instructions" \
             3 "Sélectionner la session 1 " \
             4 "Sélectionner la session 2" \
             5 "Sélectionner la session 3" \
             6 "Sélectionner la session 4" \
             Quit  "End the experiment"  2>$tempfile

  retvat=$?
  resp=$(cat $tempfile)

  case $resp in
      1) python quick_localizer_standard.py;;
      2) python quick_localizer_standard.py;;
      3) python quick_localizer_standard.py;;
      4) python quick_localizer_standard.py;;
      5) python quick_localizer_standard.py;;
      6) python quick_localizer_standard.py;;
      Quit) echo "Finito!" ;;
      *) dialog --msgbox "I do not understand..." 6 32 ;;
  esac

done