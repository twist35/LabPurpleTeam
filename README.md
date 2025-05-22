# 🚀 LabPurpleTeam - Sécurité de Ouf !

Bienvenue dans **LabPurpleTeam**, votre laboratoire de sécurité ultra-connecté et blindé grâce à **Wazuh** ! Ici, on fait de la surveillance de sécurité comme des pros. 💪

---
## Déploiement de l'infrastructure


```bash
# Initialiser le projet Terraform
terraform init

# Vérifier le plan d’exécution
terraform plan

# Appliquer le plan (créer/modifier l’infrastructure)
terraform apply
```


## 🛠️ Déploiement de l'architecture Wazuh

1. **Lancer Terraform** pour créer l'architecture de dingue Wazuh :

   ```bash
   terraform apply
   ```

/!\ Port Forward pour ansible

2. **Déployer les agents** sur vos machines cibles avec Ansible :



   ```bash
   ansible-playbook -i hosts.ini playbook.yml -vvv --ssh-extra-args="-o StrictHostKeyChecking=no"
   ```

---

## 🔑 Connexion SSH de Fou

Pour vous connecter en SSH à la machine Wazuh, utilisez cette commande qui déchire :

```bash
ssh -o "IdentitiesOnly=yes" -o "ProxyCommand=ssh -i ~/.ssh/mykey -W %h:%p ec2-user@51.44.226.200" -i ~/.ssh/mykey wazuh-user@10.0.1.50
```

---

## 🌐 Accès au Dashboard Wazuh

Pour accéder à l’interface de gestion super stylée de Wazuh, utilisez ce tunnel SSH ultra sécurisé :

```bash
sudo ssh -L 1234:10.0.1.50:443 -i ~/.ssh/mykey -o "ProxyCommand=ssh -i ~/.ssh/mykey -W %h:%p ec2-user@51.44.226.200" wazuh-user@10.0.1.50
```

Ensuite, ouvrez votre navigateur sur :

```
https://localhost:1234
```

### Identifiants

Username : admin
Password : <Instance Id> (avec le I en majuscule) Exemple : I-00ba406a1c625db3c

---



## 🎉 Enjoy!

Et voilà ! Vous êtes prêt à dompter la cybersécurité avec Wazuh ! Si vous avez des questions, n'hésitez pas à nous contacter. Let's make security epic! 🔥

*Martin t'es grave beau*


## Déploiement de l'infra Zabbix

```bash
ssh -o "IdentitiesOnly=yes" -o "ProxyCommand=ssh -i ~/.ssh/mykey -W %h:%p ec2-user@51.44.226.200" -i ~/.ssh/mykey admin@10.0.1.25
```


## Accès Dashboard Zabbix

```bash
sudo ssh -L 7654:10.0.1.25:80 -i ~/.ssh/mykey -o "ProxyCommand=ssh -i ~/.ssh/mykey -W %h:%p ec2-user@51.44.226.200" admin@10.0.1.25
```

Puis se connecter avec un navigateur au http://localhost:7654/zabbix

## FAQ

no ping to 8.8.8.8 from private instance OR no ssh after starting the instance ?
do terraform apply

## Prérequis


Un compte aws avec un s3/dynamoDB pour le backend et lockfile

Ansible, Terraform



# TODO

changer hostname machines (donc agent aussi)
Agent Zabbix