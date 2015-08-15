base-add-repositories:
  cmd.run:
    - name: add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" && touch /var/local/.archive.ubuntu.com
    - onlyif: test ! -e /var/local/.archive.ubuntu.com

base-apt-update:
  cmd.run:
    - name: apt-get update && touch /var/local/.base-apt-update
    - require:
        - cmd: base-add-repositories
    - onlyif: test ! -e /var/local/.base-apt-update

base-apt-upgrade:
  cmd.run:
    - name: apt-get upgrade -y && touch /var/local/.base-apt-upgrade
    - require:
        - cmd: base-apt-update
    - onlyif: test ! -e /var/local/.base-apt-upgrade

base-deps:
  pkg:
    - installed
    - pkgs:
      - vim
      - curl
      - autoconf
      - binutils-doc
      - build-essential
      - ncurses-dev
      - libtool
      - git
    - require:
      - cmd: base-apt-update
