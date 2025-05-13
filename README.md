# LabPurpleTeam

## Wazuh

SSH connect : 
ssh -o "IdentitiesOnly=yes"     -o "ProxyCommand=ssh -i mykey -W %h:%p ec2-user@51.44.226.200"     -i mykey wazuh-user@10.0.1.50