#! /bin/bash
set -ex

# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`

for script in Scripts bin; do
  [[ -f $SCRIPTPATH/../../env/$script/ansible-playbook ]] && \
    $SCRIPTPATH/../../env/$script/ansible-playbook -i $SCRIPTPATH/inventory.yml \
      $SCRIPTPATH/ssh-key.yml --ask-pass --ask-become-pass --user ubuntu
done
