#!/bin/bash

set -e

echo "🚀 Déploiement de la machine Bodega avec Ansible"

echo "🔗 Test de connexion à la machine distante..."
ansible -i ansible/hosts.ini bodega -m ping

echo "📦 Lancement du playbook..."
ansible-playbook -i ansible/hosts.ini ansible/playbook.yml

echo "✅ Déploiement terminé avec succès !"

