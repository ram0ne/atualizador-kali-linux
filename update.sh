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


(($UID > 0)) && { echo "Entre como ROOT e prossiga!!" ; exit 1 ;}
[[ $# -eq 0 ]] && { echo -e "${verm}Use --help para ver ajuda.$fim" ; exit 1 ;}

case $1 in
-up)
#==========================================================
files_log
 etapa1 ; etapa2 ; etapa3 ; etapa4
reg
shift
;;

-e1) etapa1 ; reg
shift
;;

-e2) etapa2
shift
;;

-e3) etapa3
shift
;;

-e4) etapa4 ; reg
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
