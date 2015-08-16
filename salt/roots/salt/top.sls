base:
  '*':
    - base
    - mesosphere.install

    - mesosphere.zookeeper.config
    - mesosphere.zookeeper.master

    - mesosphere.mesos.master

    - mesosphere.zookeeper.service
    - mesosphere.mesos.service
    - mesosphere.chronos.service
