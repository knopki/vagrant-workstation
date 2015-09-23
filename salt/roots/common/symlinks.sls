/vagrant/home/.config:
  file.directory: []

/home/vagrant/.config:
  file.symlink:
    - target: /vagrant/home/.config
    - require:
      - file: /vagrant/home/.config

/vagrant/home/.docker:
  file.directory: []

/home/vagrant/.docker:
  file.symlink:
    - target: /vagrant/home/.docker
    - require:
      - file: /vagrant/home/.docker

/vagrant/home/Development:
  file.directory: []

/home/vagrant/Development:
  file.symlink:
    - target: /vagrant/home/Development
    - require:
      - file: /vagrant/home/Development

/home/vagrant/.gitconfig:
  file.symlink:
    - target: /vagrant/home/.gitconfig