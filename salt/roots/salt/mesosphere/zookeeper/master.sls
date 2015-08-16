add-zookeeper-config:
  cmd.run:
    - name: echo "{{ salt['pillar.get']('host:id', '1') }}" > /etc/zookeeper/conf/myid
    - require:
        - pkg: mesosphere

  file.managed:
    - name: /etc/zookeeper/conf/zoo.cfg
    - source: /srv/salt/mesosphere/zookeeper/files/zoo.cfg
    - template: jinja
    - require:
        - pkg: mesosphere
