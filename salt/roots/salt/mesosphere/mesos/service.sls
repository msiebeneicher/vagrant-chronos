mesos-master:
  service.running:
    - enable: True
    - reload: True

mesos-slave:
  service.running:
    - enable: True
    - reload: True
