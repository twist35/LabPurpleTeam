#!/bin/bash

set -e

echo "🚀 Déploiement de la machine Bodega avec Ansible"

echo "📚 Vérification/installation de la collection Ansible community.mysql..."
ansible-galaxy collection install community.mysql --force

echo "🔗 Test de connexion à la machine distante..."
ansible -i ansible/hosts.ini bodega -m ping

echo "📦 Lancement du playbook..."
ansible-playbook -i ansible/hosts.ini ansible/playbook.yml

echo "✅ Déploiement terminé avec succès !"

