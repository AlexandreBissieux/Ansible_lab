group="omega"
users="alpha beta gamma"
ansible node1 -e "group=${group}" -m group -a "name={{ group }}"
for user in ${users} ; do
ansible node1 -e "user=${user}" -m group -a "name={{ user }}"
ansible node1 -e "group=${group} user=${user}" -m user -a "name={{ user }} group={{ user }} groups={{ group }} append=yes"
ansible node1 -e  "user=${user}" -m authorized_key -a "user={{ user }} key='{{ lookup('file', '~/nodes.key.pub') }}'"
done
