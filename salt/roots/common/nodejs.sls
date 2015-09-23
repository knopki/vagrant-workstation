nodejs-repo:
  pkgrepo.managed:
    - humanname: NodeJS repository
    - name: deb https://deb.nodesource.com/node_4.x jessie main
    - file: /etc/apt/sources.list.d/nodejs.list
    - key_url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key

nodejs-install:
  pkg.installed:
    - pkgs:
      - nodejs:
    - require:
      - pkg: apt-transport-https-install
      - pkgrepo: nodejs-repo

bower:
  npm.installed:
    - require:
      - pkg: nodejs-install