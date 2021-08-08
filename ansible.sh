#!/bin/sh

if [ -d "playbooks/${playbookPath}" ]
then
  find playbooks/${playbookPath}/ -maxdepth 1 -type f -exec cp {} . \;
fi

if [ -f "inventories/${JOB_NAME}/${targetEnv}" ]
then
  export extraVars = "-i inventories/${JOB_NAME}/${targetEnv} ${extraVars}"
fi


echo "[DEVOPS-PIPE-INFO] ansible-playbook ${extraVars} ${playbookName}"
ansible-playbook ${extraVars} ${playbookName}
