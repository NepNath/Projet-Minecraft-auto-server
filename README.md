# Projet infra Ynov B1 2024

## Sommaire

- [Sommaire](#sommaire)
- [Introduction](#introduction)
- [Présentation du projet](#présentation-du-projet)
- [Prérequis](#prérequis)
- [Installation et utilisation](#installation-et-utilisation)

## Introduction

Ce projet a pour but de rentre l'installation d'automatiser l'installation d'un serveur Minecraft sur Linux OS. 

## Présentation du projet

Comme dit précédemment, ce projet a pour but d'automatiser l'installation d'un serveur Minecraft sur un serveur Linux. Pour cela, nous allons utiliser un script bash qui va installer les dépendances nécessaires, télécharger le fichier .jar du serveur Minecraft et le lancer.

Le script bash va également permettre de gérer le serveur Minecraft, c'est-à-dire de le démarrer, de l'arrêter, de le redémarrer et de voir son statut.

## Prérequis

Pour pouvoir utiliser ce script, il faut avoir un serveur Linux (testé sur Debian 12) et être connécté à la machine possèdant les scripts pour lancer le serveur ! 

Il est conseillé de le mettre dans le dosser `/home` car le script crée des dossiers et fichiers, il est donc recommendé de le mettre dans un dossier où l'utilisateur a les droits d'écriture, ainsi qu'un dossier assez naviguable.

## Installation-et-utilisation

[![Télécharger](https://img.shields.io/badge/T%C3%A9l%C3%A9charger-Fichier-blue)](https://github.com/NepNath/Projet-Minecraft-auto-server/releases/download/uptodate/autoserver.sh)

Pour l'installation, vous avez besoin de faire ces commandes :

```bash
chmod +x ./autoserver.sh
```
/!\ Attention, il est fortement conseiller de lancer le script avec la commande suivante :
```bash 
$ sudo ./autoserv.sh
``` 
Vous avez juste besoin du script ! Il n'y a pas besoin de fichier anexe, simplement le script. 

Une fois en votre posséssion, il vous suffira de lancer le script avec `./autoserver.sh` et de suivre les instructions indiqué par le script (ram allouée, version du serveur, etc...)

Ensuite après que le  serveur installé, le script vous l'indiquera d'un message vous indiquant l'ip et le port du serveur, vous n'aurez plus qu'a vous y connecter et jouer avec vos amis !

