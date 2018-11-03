.PHONY: sync
sync:
	git pull --rebase origin master
	which ansible || sudo dnf install --assumeyes ansible python2-dnf
	ansible-playbook --ask-become-pass local.yml
