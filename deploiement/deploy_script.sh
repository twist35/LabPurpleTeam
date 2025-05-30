#!/bin/bash

set -e

echo "🚀 Déploiement des configurations sur les différentes machines"

echo "📚 Vérification/installation des collections Ansible ..."
ansible-galaxy collection install -r requirements.yml #--force

echo "🔗 Test de connexion aux machines distantes..."
ansible -i inventory/hosts.yml all -m ping --ssh-common-args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'


 echo "📦 Lancement de tout le playbook..."
 ansible-playbook -i inventory/hosts.yml playbook.yml

 echo "✅ Déploiement terminé avec succès !"

