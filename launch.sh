#!/bin/bash
set -e

echo "🚀 Lancement de Terraform dans le dossier infra/ ..."
cd infra/

# 🔍 Init seulement si nécessaire
if [ ! -d ".terraform" ] || [ ! -f ".terraform.lock.hcl" ]; then
  echo "🛠️  Initialisation de Terraform (init)..."
  terraform init
else
  echo "✅ Terraform déjà initialisé, init non nécessaire."
fi

echo "📦 Application de Terraform..."
terraform apply -auto-approve

echo "🌐 Récupération de l'IP du bastion..."
BASTION_IP=$(terraform output -raw bastion_ip)

cd ..

GROUP_VARS_FILE="deploiement/inventory/group_vars/all.yml"

echo "📝 Mise à jour de $GROUP_VARS_FILE avec bastion_ip=$BASTION_IP ..."
sed -i "s/^bastion_ip: .*/bastion_ip: ${BASTION_IP}/" "$GROUP_VARS_FILE"

echo "✅ Résultat final :"
grep bastion_ip "$GROUP_VARS_FILE"

echo "📦 Lancement du playbook Ansible ..."
ansible-playbook -i deploiement/inventory/ playbook.yml

terraform apply -auto-approve

echo "🌐 Récupération de l'IP du bastion..."
BASTION_IP=$(terraform output -raw bastion_ip)

cd ..

GROUP_VARS_FILE="deploiement/inventory/group_vars/all.yml"

echo "📝 Mise à jour de $GROUP_VARS_FILE avec bastion_ip=$BASTION_IP ..."
sed -i "s/^bastion_ip: .*/bastion_ip: ${BASTION_IP}/" "$GROUP_VARS_FILE"

echo "✅ Résultat final :"
grep bastion_ip "$GROUP_VARS_FILE"

echo "📦 Lancement du playbook Ansible ..."
ansible-playbook -i deploiement/inventory/ playbook.yml
