#!/usr/bin/env bash

#Criado por Luciano Ramone
#Sistema de atualização simples...
#Feito em Kali Linux 2021
#ZSH

verm="\e[31;1m"
verd="\e[32;1m"
ci="\e[36;1m"
fim="\e[m"

source etapas.conf
logs="/root/log_up.txt"
logs2="/root/log_stages.txt"
last_log="/root/last.txt"


(($UID > 0)) && { echo "Entre como ROOT e prossiga!!" ; exit 1 ;}
[[ $# -eq 0 ]] && { echo -e "${verm}Use --help para ver ajuda.$fim" ; exit 1 ;}

if [[ -e $last_log ]] || [[ -e $logs2 ]];then
	echo -e "${verd} ${fim}"
	sleep 1s
else
>>$last_log
>>$logs2
fi

case $1 in
-up) etapa1 ; etapa2 ; etapa3 ; etapa4 ; etapa5 ; reg
shift
;;

-1) etapa1 ; reg
shift
;;

-2) etapa2 ; reg
shift
;;

-3) etapa3 ; reg
shift
;;

-4) etapa4 ; reg
shift
;;

-5) etapa5 ; reg
shift
;;

-u) last
;;

--help) helping
shift
;;

-d) del_log
;;

-l) loggg
;;
esac
