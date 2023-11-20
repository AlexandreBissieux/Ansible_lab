for format in gz zip xz bz2 ; do
ansible nodes -e "format=${format}" -m archive -a "path=/usr/share/doc dest=/tmp/doc.{{ format }} format={{ format }}"
done
