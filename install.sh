#!/bin/bash

remover=(aspell-* brasero* firefox-esr-l10n-* myspell-* gnome-games)
dependencia=(dirmngr apt-transport-https ca-certificates)
==== BASE ====
instalacao=(dbeaver-ce meld bash-completion sublime-text google-chrome-stable mysql-workbench vim git git-flow spotify-client hunspell-en hunspell-pt-br myspell-en myspell-pt-br firefox-esr-l10n-en-gb firefox-esr-l10n-pt-br dbeaver-ce php7.2-cli php7.2-common php7.2-curl php7.2-mbstring php7.2-mysql php7.2-xml)
==== BASE ====

echo -e "\e[32m---------------------------------------------\e[0m"
echo -e "\e[31mRemoveremos arquivos desnecessarios ;)\e[0m"
echo -e "\e[32m---------------------------------------------\e[0m"

#remover pacotes desnecessarios
for item in ${remover[*]}
do
    apt-get remove --purge -y $item
done

echo -e "\e[32m---------------------------------------------\e[0m"
echo -e "\e[31m  Verificamos se as dependencias\e[0m"


#basics install
for item in ${dependencia[*]}
do
	if [ $(dpkg-query -W -f='${Status}' $item 2>/dev/null | grep -c "ok installed") -eq 0 ];
	then
	  apt-get install -y $item;

	 echo -e "\e[92m   - $item \e[1m Foi instalado com sucesso! \e[0m"
	 else
	  echo -e "\e[92m   - $item \e[1m Já instalado \e[0m"
	fi
done

echo -e "\e[32m---------------------------------------------\e[0m"

#apt-get update && apt-get upgrade -y

echo -e "\e[32m---------------------------------------------\e[0m"
echo -e "\e[31m Instalando Chaves ;)\e[0m"

#chave Sury php7
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
echo -e "\e[92m   - Chave PHP sury \e[1m instalado \e[0m"

#Chade dbeaver
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo -e "\e[92m   - Chave Dbeaver \e[1m instalado \e[0m"

#chave sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo -e "\e[92m   - Chave Sublime \e[1m instalado \e[0m"

#spotify chave
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo -e "\e[92m   - Chave Spotify \e[1m instalado \e[0m"

#chave google 
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo -e "\e[92m   - Chave Google \e[1m instalado \e[0m"

echo -e "\e[32m---------------------------------------------\e[0m"

#spotify
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list

#google
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list

#spotify
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

#dbeaver
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list

#PHP7
echo "deb https://packages.sury.org/php/ stretch main" | sudo tee /etc/apt/sources.list.d/php.list

#Get Mysql Repository
wget -O mysql.deb https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb && dpkg -i mysql.deb 
rm mysql.deb 

wget -O teamviewer.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && dpkg -i teamviewer.deb  
rm teamviewer.deb 


#Update no apt
apt-get update

#Instaladores

for item in ${instalacao[*]}
do
	if [ $(dpkg-query -W -f='${Status}' $item 2>/dev/null | grep -c "ok installed") -eq 0 ];
	then
	    apt-get install -y $item;
	    echo -e "\e[92m   - $item \e[1m Foi instalado com sucesso! \e[0m"
	 else
	    echo -e "\e[92m   - $item \e[1m Já instalado \e[0m"
	fi
done


apt-get autoremove -y
apt-get autoclean -y
apt-get clean -y



for item in ${instalacao[*]}
do
	if [ $(dpkg-query -W -f='${Status}' $item 2>/dev/null | grep -c "ok installed") -eq 0 ];
	then
	    echo -e "\e[10m   - $item \e[31m Não foi instalado! \e[0m"
	 else
	    echo -e "\e[0m   - $item \e[92m Foi instalado \e[0m"
	fi
done

cp -i .bach_aliases $HOME
cp -i .gitconfig $HOME/
cp -i .bash_profile $HOME/.bash_profile
cp -i .bashrc $HOME/.bashrc
cp -i .profile $HOME/.profile
cp -ir .bash_it $HOME/.bash_it

bash-it update
