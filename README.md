Rôle Name Welcome noobs
========================

Welcome noobs est un role qui se charge de configurer l'ordinateur du nouvel admin sys

Requirements
------------
Editer le fichier welcome-noobs-deploy.sh :
sudo vi welcome-noobs-deploy.sh
 --> var=yum [ Quand c'est une distribution RedHat]

 --> var=apt-get [ Quand c'est une distribution Debian]

Enregistrer & quitter

Executer la commande :
$ sudo sh welcome-noobs-deploy.sh

Sous debian installer sudo
# apt-get install sudo

Role Variables
--------------
_packages: contient la liste des packages qui ne necessitent aucune dependance avant d'être installée
_dependances: contient la liste des dependances necessaire pour l'installation de certain package
_deb: dans le cas des distribution sous debian pour lequel le MODULE PACKAGE a du mal à gérer les packages

Debian.yml | RedHat.yml : contient les variables selon les familles d'OS (ex: owncloud[RedHat] && owncloud-client[Debian]

Dependencies
------------
Avoir un utilisateur en sudo

Dans le cas des distribution Debian ajouter le repo approprié afin d'avoir une version d'ansible >= 2.1

# echo 'deb http://http.debian.net/debian jessie-backports main' > /etc/apt/sources.list.d/backports.list

# apt-get update
# apt-get -t jesssie-backports install "ansible"


tests/inventory ==> contient les hotes sur lesquelles le playbook sera deployé

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:
---
- hosts: all
  become: true
  become_method: su
  become_user: root

  vars_files:
    - [ "../vars/RedHat.yml", "../vars/Debian.yml" ]
  roles:
    - welcome-noobs

License
-------

BSD

Author Information
------------------

Franck Aboa Stagiaire Admin Sys | SMILE ci
