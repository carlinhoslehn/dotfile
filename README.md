# .files
Este é um projeto livre, pode pegar qualquer parte e usar por sua conta em risco!
Este projeto é para sistemas Linux baseados em Debian.

## O projeto
Este projeto é para manter as personalizações dos meus ambientes de trabalho, assim como os pacotes que eu utilizo normalmente.

## Pacotes
* [Sublime Text3](https://www.sublimetext.com/) - Editor de Texto
* VIM - Editor de texto via terminal
* git - Mantenedor de Versão de arquivos
* [git-flow](https://danielkummer.github.io/git-flow-cheatsheet/) - Métodologia de trabalho
* [Mysql tools (tools e Workbench)](https://dev.mysql.com/downloads/repo/apt/) - Aplicativos para banco de dados Mysql,IDE e Banco de dados mysql
* [Spotify](www.spotify.com/‎) - Player de música

### Instalação
A instalação se da da seguinte forma:
 bash -c "`curl -fsSL https://raw.githubusercontent.com/carlinhoslehn/dotfile/master/install.sh`"
 Você pode (usar `git`), ou fazer o download (usar `curl` or `wget`), e colocar na pasta `~/.dotfiles`. Como alternativa, você pode clonar manualmente:

    git clone https://github.com/carlinhoslehn/dotfiles.git ~/.dotfiles

Para iniciar o processo de instalação basta utilizar o terminal:
```sh
# cd ~/.dotfiles
# ./install.sh
```
Caso seu usuario esteja cadastrado no sudoers...
```sh
$ cd ~/.dotfiles
$ sudo ./install.sh
```
Ao Final da instalação será exibido quais pacotes tiveram exito na instalação,
caso aconteça algum erro você precisará instalar manualmente o pacote.
