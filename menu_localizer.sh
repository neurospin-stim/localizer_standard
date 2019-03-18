#! /bin/bash

tempfile=`(tempfile) 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 $SIG_NONE $SIG_HUP $SIG_INT $SIG_QUIT $SIG_TERM

resp=0

cmd_localizer='python localizer_standard.py --background-color 0 0 0 
            --text-color 250 250 250 --rsvp-display-time 250 
            --rsvp-display-isi 100 --picture-display-time 200 
            --picture-isi 0 --fs_delay_time 100 
            --stim-dir stim_files --total-duration 301000'

echo $cmd_localizer


until [ "$resp" = "Quit" ]
do
    next=$(($resp + 1))
    if [ $next = "11" ]; then
        next="Quit";
    fi


#<width-of-box> <top-of-box> <number-of-options-visible>

    dialog --clear --title "Localizer standart" "$@" \
         --nocancel --default-item  "$next" \
         --menu "Sélectionner votre choix et appuyer sur entrée\n" \
             24 40 7 \
             1 "Effectuer un calibrage" \
             2 "Afficher les instructions" \
             3 "Session 1 " \
             4 "Session 2" \
             5 "Session 3" \
             6 "Session 4" \
             Quit  "End the experiment"  2>$tempfile

  retvat=$?
  resp=$(cat $tempfile)

  case $resp in
      1) cali=' --cali'
         echo $cali
         $cmd_localizer$cali;;
      2) calibration='--splash instructions_localizer.csv'
         $cmd_localizer$calibration;;
      3) session=' --csv_file session1_localizer_standard.csv'
         echo $session
         $cmd_localizer$session;;
      4) session=' --csv_file session2_localizer_standard.csv'
         echo $session
         $cmd_localizer$session;;
      5) session=' --csv_file session3_localizer_standard.csv'
         echo $session
         $cmd_localizer$session;;
      6) session=' --csv_file session4_localizer_standard.csv'
         echo $session
         $cmd_localizer$session;;
      Quit) echo "Finito!" ;;
      *) dialog --msgbox "I do not understand..." 6 32 ;;
  esac

done