https://github.com/robbyrussell/oh-my-zsh.git:
  git.latest:
    - target: /home/vagrant/.oh-my-zsh
    - user: vagrant
    - depth: 1

/vagrant/home/.zshrc:
  file.copy:
    - source: /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template
    - force: False
    - preserve: True

/home/vagrant/.zshrc:
  file.symlink:
    - target: /vagrant/home/.zshrc
    - require:
      - file: /vagrant/home/.zshrc

vagrant-user-change-shell:
  user.present:
    - name: vagrant
    - shell: /bin/zsh
    - require:
      - git: https://github.com/robbyrussell/oh-my-zsh.git
      - file: /home/vagrant/.zshrc