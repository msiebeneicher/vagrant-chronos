add-mesos-zookeeper-config:
  file.managed:
    - name: /etc/mesos/zk
    - source: /srv/salt/mesosphere/zookeeper/files/mesos.config
    - source_hash: md5=5e307e6cc9b68128efb85e6926cccb9a
    - template: jinja
