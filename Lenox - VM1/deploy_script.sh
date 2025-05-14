#!/bin/bash

set -e

echo "🚀 Deploy Lenox machine with ansible"

echo "🔗 Test remote connexion..."
ansible -i ansible/hosts.ini lenox -m ping

echo "📦 Launch playbook..."
ansible-playbook -i ansible/hosts.ini ansible/playbook.yml

echo "✅ Deploy end with success !"

