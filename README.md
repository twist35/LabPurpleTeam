# 🚀 LabPurpleTeam 

Notre projet consiste à concevoir un lab Purple Team dont le déploiement est 100% automatisé avec l’IaC, en utilisant Terraform pour le déploiement et Ansible pour la configuration des machines. Ce lab comprend deux environnements vulnérables destinés aux attaques (Red Team), et plusieurs machines défensives (Blue Team) pour mettre en place des outils de monitoring, de détection et de réponse.

Le projet a été réalisé en 2 semaines, par deux groupes de deux étudiants, chacun apportant ses compétences offensives ou défensives. 

L’objectif : simuler des scénarios d’attaque réalistes, observer les réactions des systèmes face à ces attaques.

## Informations

Ce projet est configuré par défaut pour se lancer sur la région Paris (eu-west-3) d'AWS.
Il est possible de déployer sur la région Dublin (eu-west-1) sur la branche "eu-west-1"

## Prérequis

- compte aws avec un S3 pour le dynamoDB et un DynamoDB pour lockfile (à configurer dans infra/backend.tf)
- Ansible
- Terraform 

---
## Déploiement de l'infrastructure

Pour déployer toute l'infrastructure, il s'agit d'éxécuter :

```bash
./launch.sh
```

Ce script déploi le terraform et l'ansible à la suite.


## 🛠️ Déploiement de l'architecture Wazuh

### 🔑 Connexion SSH 

Pour vous connecter en SSH à la machine Wazuh, utilisez cette commande :

```bash
ssh -o "IdentitiesOnly=yes" -o "ProxyCommand=ssh -i ~/.ssh/mykey -W %h:%p ec2-user@51.44.226.200" -i ~/.ssh/mykey wazuh-user@10.0.1.50
```

---

### 🌐 Accès au Dashboard Wazuh

Pour accéder à l’interface de gestion de Wazuh, utilisez ce tunnel SSH sécurisé :

```bash
sudo ssh -L 1234:10.0.1.50:443 -i ~/.ssh/mykey -o "ProxyCommand=ssh -i ~/.ssh/mykey -W %h:%p ec2-user@51.44.226.200" wazuh-user@10.0.1.50
```

Ensuite, ouvrez votre navigateur sur :

https://localhost:1234


**Identifiants**

Username : admin
Password : <Instance Id> (avec le I en majuscule) Exemple : I-00ba406a1c625db3c

---

## Déploiement de l'infra Zabbix

Pour vous connecter en SSH à la machine Zabbix, utilisez cette commande :


```bash
ssh -o "IdentitiesOnly=yes" -o "ProxyCommand=ssh -i ~/.ssh/mykey -W %h:%p ec2-user@51.44.226.200" -i ~/.ssh/mykey rocky@10.0.1.25
```

## Accès Dashboard Zabbix

Pour accéder à l’interface de gestion de Zabbix, utilisez ce tunnel SSH sécurisé :

```bash
sudo ssh -L 7654:10.0.1.25:80 -i ~/.ssh/mykey -o "ProxyCommand=ssh -i ~/.ssh/mykey -W %h:%p ec2-user@51.44.226.200" rocky@10.0.1.25
```

Puis se connecter avec un navigateur au http://localhost:7654/zabbix