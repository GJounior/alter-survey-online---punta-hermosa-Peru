#!/bin/bash 

URL="https://www.pulsomunicipal.com/pulso-municipal/punta-hermosa-encuesta-online-mayo-2022/"
optionCandidate=0
optionVotes=0

candidates_token[1]="205efb70-8962-4472-bbc4-fa5b2a9df52d";
candidates_token[2]="2a31c14e-4c52-424b-a011-87dd8f30b248";
candidates_token[3]="81455fc3-c4d4-4d73-987d-22609b152ee4";
candidates_token[4]="63b1fa22-8bec-42e9-a424-2b90b60303a5";
candidates_token[5]="25c97d0a-c26f-43a7-ae01-b19a06904a7e";
candidates_token[6]="0686aa83-86e8-4010-a5af-3c43ca35150d";
candidates_token[7]="71b7dc58-2416-48de-b8b5-16367d808124";
candidates_token[8]="64ec1447-2fea-45c3-bf1d-a1a94cd03cb6";
candidates_token[9]="b50d0f8c-131a-4108-9395-0b84bee3e262";

banner(){
    echo "";
    echo "";
    echo " \\ \\    / / __ \\__   __|  ____| "
    echo "  \\ \\  / / |  | | | |  | |__   "
    echo "   \\ \\/ /| |  | | | |  |  __|  "
    echo "    \\  / | |__| | | |  | |____ "
    echo "     \\/   \\____/  |_|  |______|"
    echo "  More votes for you favorite candidate!! "
    echo ""
}

usage(){
    banner
}

timeout(){
    sleep 2
}

vote(){
    echo -n "[+] Voting: "
    status_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST $URL -F totalpoll[choices][764b3d2f-a851-46c5-bf66-330290074d5c][]=${candidates_token[$optionCandidate]} -F totalpoll[screen]=vote -F totalpoll[pollId]=8263 -F totalpoll[action]=vote -H "User-Agent: Mozilla/5.0 (Linux; Android 6.0.1; SM-G920V Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Mobile Safari/537.36")

    timeout

    if [ ${status_code} -eq "200" ]
    then
        echo "done."
    else
        echo "error."
    fi
}

menu(){
    usage
    echo ""
    echo ""
    echo "1) AMÉRICA ALEJANDRINA PURCA YBARRA - PERÚ LIBRE";
    echo "2) CARLOS GUILLERMO FERNANDEZ OTERO - AVANZA PAÍS";
    echo "3) FEDERICO GUILLERMO ABRAHAM KAJATT KAJATT - ALIANZA PARA EL PROGRESO";
    echo "4) LUIS FELIPE MORENO TORRES - FUERZA POPULAR";
    echo "5) MAX ANDRE AMPUERO LEANDRO - SOMOS PERÚ";
    echo "6) RICHARD MANUEL PEREIRA NUÑEZ - PODEMOS PERÚ";
    echo "7) ROCIO PAZOS ARNILLAS - RENOVACIÓN POPULAR";
    echo "8) NULO / VICIADO";
    echo "9) OTRO";
    echo ""
    echo -n "Candidate: "; read optionCandidate;
    echo -n "# Votes: "; read optionVotes
}


main(){
    menu

    for (( index = 1; index <= $optionVotes; index++ ))
    do
        vote
    done
}

main
