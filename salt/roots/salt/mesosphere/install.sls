add-repository:
  cmd.run:
    - name: |
        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
        DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
        CODENAME=$(lsb_release -cs)

        echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | sudo tee /etc/apt/sources.list.d/mesosphere.list
        sudo apt-get -y update
    - unless: test -f /etc/apt/sources.list.d/mesosphere.list

mesosphere:
  pkg.installed:
    - require:
        - cmd: add-repository
