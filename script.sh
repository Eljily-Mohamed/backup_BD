#!/bin/bash
##############################
#
#    Backup to database Eljily Mohamed 
#
#
#############################

#clear the screan
clear
#fonction verifaction de l'exstance de base de donnes 
function checkdatabase(){
    if [ -d "/opt/oracle/oradata/$1" ]; then
     echo found
     backup_files="/opt/oracle/oradata/$1/"
     else
     echo not database found 
     main
     fi
}
function checkPluggable(){
    if [ -d "/opt/oracle/oradata/$1/$2" ]; then
     echo found
    backup_files="/opt/oracle/oradata/$1/$2/"
    else
    echo not pluggable found
    main
    fi
}

function createBackup(){
     #un cas find Database
     # Where to backup to.
     read -p "Destination de votre backup /home/USERNAME/ : " destuser
     dest="/home/$USER/$destuser"
     mkdir -p $dest
     # Create archive filename.
     date_creation=$(date +"%m_%d_%Y_%H_%M")
     archive_file="$1-$2-$date_creation.tgz"
     # Print start status message.
     echo "$1 to $dest/$archive_file$hostname"
     echo
     tar czf $dest/$archive_file --absolute-names  $backup_files
     # Print end status message.
     echo
     date
     # Long listing of files in $dest to check file sizes.
     ls -lh $dest
}

createSpecified(){
     read -p "Destination de votre backup fichier d'extantion .$1 /home/USERNAME/ : " destuser
     destfile="/home/$USER/$destuser"
     mkdir -p $dest
}

function createSpecifiedf(){
     read -p "Destination de votre backup fichier d'extantion .$1 /home/USERNAME/ : " destuser
     destfile="/home/$USER/$destuser"
     mkdir -p $destfile
     # Create archive filename.
     date_creation=$(date +"%m_%d_%Y_%H_%M")
     archive_file="$ORA-$date_creation.tgz"
     echo "fichier de extantion .$1 to $destfile/$archive_file"
     tar czf $destfile/$archive_file  --absolute-names $( find $backup_files -name *.$1 )
}
   
#end fonctions 
#start fonction main 
function main(){
#qestion and reponses
read -p "vous voulez faire Backup de database ou Pluggable : b/p :" reponse
if [[ "$reponse" =~ ^([Bb][aA][sS][Ee]|[bB])$ ]]
then
read -p "Donner le nom de la base de donne : " reponseBa
echo $reponseBa
checkdatabase $reponseBa
extantions=(dbf ctl log)
description=(Datafiles controles journal)
read -r -p "fichier precis or Database complexe ? [y/N]" response
case "$response" in
    [yY][eE][sS]|[yY])
       for ((i=0;i<3;i=i+1)); do 
       sleep 1
       read -r -p "fichier ${description[$i]} .${extantions[$i]}? [y/N]" response
       case "$response" in
          [yY][eE][sS]|[yY])
          createSpecifiedf ${extantions[$i]};;
          *)
           echo "ignor"
          ;;
          esac
          done
          ;;
       *)
        echo "databaseComplet"
        ;;
esac
createBackup $reponseBa
elif [[ "$reponse" =~ ^([pP][lL][uU][gG]|[pP])$ ]]
then
read -p "Donner le nom de la base de donne : " reponseBase
echo $reponseBase 
checkdatabase $reponseBase
read -p "Donner le nom de la pluggable : " reponsePlug
echo $reponseBase/$reponsePlug
checkPluggable $reponseBase $reponsePlug
createBackup $reponseBase $reponsePlug
else
     echo "reponde par P or b"
     main
fi
}

main
