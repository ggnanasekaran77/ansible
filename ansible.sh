#!/bin/sh

if [ -d "playbooks/${playbookPath}" ]
then
  find playbooks/${playbookPath}/ -maxdepth 1 -type f -exec cp {} . \;
fi

if [ -f "inventories/${JOB_NAME}/${targetEnv}" ]
then
  ansible-playbook -i inventories/${JOB_NAME}/${targetEnv} ${extraVars} ${playbookName}
else
  ansible-playbook ${extraVars} ${playbookName}

fi


