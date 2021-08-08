#!/bin/sh

if [ -d "playbooks/${playbookPath}" ]
then
  find playbooks/${playbookPath}/ -maxdepth 1 -type f -exec cp {} . \;
fi

if [ -f "inventories/${JOB_NAME}/${targetEnv}" ]
then
  echo "[DEVOPS-PIPE-INFO] ansible-playbook -i inventories/${JOB_NAME}/${targetEnv} ${extraVars} ${playbookName}"
  ansible-playbook -i inventories/${JOB_NAME}/${targetEnv} ${extraVars} ${playbookName}
else
  echo "inventories/${JOB_NAME}/${targetEnv} not found"
  exit 1
fi


