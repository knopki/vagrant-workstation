composer-install:
  cmd.run:
    - name: 'CURL=`which curl`; $CURL -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer'
    - unless: test -f /usr/local/bin/composer