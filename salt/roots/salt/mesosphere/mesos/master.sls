add-mesos-master-configuration:
  cmd.run:
    - name: echo {{ salt['pillar.get']('host:ip', '127.0.0.1') }} | tee /etc/mesos-master/ip && cp /etc/mesos-master/ip /etc/mesos-master/hostname
    - require:
        - pkg: mesosphere
    - onlyif: test ! -e /etc/mesos-master/ip
