docker-repo:
  pkgrepo.managed:
    - humanname: Docker repository
    - name: deb https://apt.dockerproject.org/repo debian-{{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/docker.list
    - keyserver: keyserver.ubuntu.com
    - keyid: F76221572C52609D

docker-engine-install:
  pkg.installed:
    - pkgs:
      - docker-engine
    - require:
      - pkg: apt-transport-https-install
      - pkgrepo: docker-repo

docker-compose-install:
  file.managed:
    - name: /usr/local/bin/docker-compose
    - source: https://github.com/docker/compose/releases/download/1.4.0/docker-compose-Linux-x86_64
    - source_hash: md5=b0e03e5dada7991c34afc598ad873c31
    - mode: 755

docker-machine-install:
  file.managed:
    - name: /usr/local/bin/docker-machine
    - source: https://github.com/docker/machine/releases/download/v0.4.1/docker-machine_linux-amd64
    - source_hash: md5=93bfae4a59e75203e50154df075aa519
    - mode: 755