#!/bin/bash
# Autor:						Jensy Gregorio Gomez
# YouTube:						youtube.com/systech
# Instagram:					https://www.instagram.com/systech5/?hl=pt-br
# Github:						https://github.com/vaasystech-brz
# Data de criação:				01/01/2022
# Data de atualização:			01/01/2022
# Versão:						0.01
# Testado e homologado para a versão do Ubuntu Server 20.04.x LTS x64
# Testado e homologado para a versão do Asterisk v19.1.x
#
# Link do material de apoio do script: https://www.asterisksounds.org/pt-br/instalar
#
# Script de conversão de formatados de audio do Asterisk, utilizando o software sox
#
# Criação do Laço de Loop para localizar todos os arquivos com extensão *.sln16
for a in $(find . -name '*.sln16'); do
	# Convertendo os arquivo com extensão *.sln16 para *.gsm
	sox -t raw -e signed-integer -b 16 -c 1 -r 16k $a -t gsm -r 8k $(echo $a|sed "s/.sln16/.gsm/");\
	# Convertendo os arquivo com extensão *.sln16 para *.alaw
	sox -t raw -e signed-integer -b 16 -c 1 -r 16k $a -t raw -r 8k -e a-law $(echo $a|sed "s/.sln16/.alaw/");\
	# Convertendo os arquivo com extensão *.sln16 para *.ulaw
	sox -t raw -e signed-integer -b 16 -c 1 -r 16k $a -t raw -r 8k -e mu-law $(echo $a|sed "s/.sln16/.ulaw/");\
done
# Fim do script
