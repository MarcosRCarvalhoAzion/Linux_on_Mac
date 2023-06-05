#!/usr/bin/env sh
#
# Script de instalacao modulos MacBook
#
# Desenvolvido por: 
#
#	Marcos R Carvalho,
#	Security Architect | Azion
#
###############################################
echo "Instalando dependencias..."
apt update
apt install linux-headers-generic git kmod libssl-dev checkinstallpt install xz-utils curl cpio make -y
apt install xserver-xorg-video-nouveau -y
apt install nvidia-driver-390 -y
apt install bcmwl-kernel-source -y

echo "Baixando driver bcwc_pcie"
git clone https://github.com/patjak/bcwc_pcie.git
cd bcwc_pcie

echo "Compilando modulos"
make

echo "Instalando Pacotes"
make install

depmod

echo "Carregando modulo"
modprobe facetimehd

echo "Modulo Instalado com sucesso!"
echo
echo "Atualizando sistema"
apt update && apt upgrade -y

echo "Pressione [enter] para reiniciar"
read
reboot

