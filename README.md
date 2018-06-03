# integrationcontinue

Création d'un serveur Wildfly dans un conteneur LXC avec ansible

Pour créer un serveur Wildfly, il faut suivre les étapes suivantes :

- Il faut modifier le fichier SetupUbuntu en modifiant le nom du conteneur et ensuite l'executer:

  lxc exec "nom_du_conteneur" -- apt update.
  lxc exec "nom_du_conteneur" -- apt -y upgrade
  lxc exec "nom_du_conteneur" -- apt -y install openssh-server python sudo
  lxc exec "nom_du_conteneur" -- adduser wildfly
  lxc exec "nom_du_conteneur" -- usermod -a -G sudo wildfly
  lxc restart "nom_du_conteneur"
  
  sh SetUpUbuntu.sh

- Vérifier que le conteneur est accessible en ssh. Cette étape est obligatoire pour valider l'empreinte du serveur.

  ssh [IP du conteneur]
  
- Modifier l'inventaire Ansible. 

  Editez le fichier inventory.ini et ajoutez l'adresse IP du conteneur dans le groupe en l'occurrence dans le groupe TPwildfly.
  
- Modifier le fichier playbook.yml.

  Editez le et modifiez le chemin pointant le repertoire "roles"
  
- Lancer le playbook Ansible à l'aide du second script :

  sh RunPlaybook.sh
  
 - Vous pouvez accéder au serveur Wildfly à partir d'un navigateur Web à l'adresse :
 
   http://[ip conteneur]:8080

