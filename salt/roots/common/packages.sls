apt-transport-https-install:
  pkg.installed:
    - refresh: False
    - pkgs:
      - apt-transport-https

packages-install:
  pkg.installed:
    - pkgs:
      - cifs-utils
      - psmisc 
      - tree
      - net-tools
      - nano
      - wget
      - git
      - curl
      - nmap
      - mtr
      - rsync
      - whois
      - htop
      - aptitude
      - zsh
      - iperf
      - lsb-release
      - php5-cli
      - byobu
    - require:
      - pkg: apt-transport-https-install