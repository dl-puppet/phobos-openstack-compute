# phobos-openstack Compute
Installation Openstack Compute




Activer les Repos RedHat:
Epate necessaire pour les distribution Red Hat:
Sur RHEL, enregistrer votre système auprès du Gestionnaire de Souscription Red Hat, en utilisant vos nom et mot de passe d’utilisateur du portail client.
# subscription-manager register --username="USERNAME" --password="PASSWORD"

Trouver les pools d’habilitation contenant les canaux pour votre système RHEL :
# subscription-manager list --available

Utiliser les identifiants de pool trouvés à l’étape précédente pour attacher vos habilitations RHEL :
# subscription-manager attach --pool="POOLID"

Activer les dépôts nécessaires :
# subscription-manager repos --enable=rhel-7-server-optional-rpms –enable=rhel-7-server-extras-rpms --enable=rhel-7-server-rh-common-rpms



Activer le dépôt OpenStack

Sur CentOS :
Sur CentOS, le dépôt extras contient le RPM qui active le dépôt OpenStack. CentOS inclut par défaut le dépôt extras, vous pouvez donc simplement installer le package pour activer le dépôt OpenStack.
# yum install centos-release-openstack-newton

Sur RHEL :
Sur RHEL, télécharger et installer le dépôt RDO RPM pour activer le dépôt OpenStack.
# yum install https://rdoproject.org/repos/rdo-release.rpm


Finaliser l’installation:
# yum upgrade
Si la mise à jour inclut un nouveau noyau, redémarrer votre hôte pour l’activer.


