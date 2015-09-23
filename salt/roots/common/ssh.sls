/vagrant/home/.ssh/known_hosts:
  file.managed:
    - makedirs: True

/home/vagrant/.ssh/known_hosts:
  file.symlink:
    - target: /vagrant/home/.ssh/known_hosts
    - makedirs: True
  require:
    - file: /vagrant/home/.ssh/known_hosts