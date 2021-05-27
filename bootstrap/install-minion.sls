{% import_yaml slspath + '/files/bootstrap_defaults.yaml' as bootstrap_defaults %}

include:
  - .packages.gpg
  - .hostname

install minion:

  pkgrepo.managed:
    - name: "deb https://repo.saltproject.io/py3/debian/10/amd64/latest buster main"
    - key_url: https://repo.saltproject.io/py3/debian/10/amd64/latest/salt-archive-keyring.gpg
    - gpgcheck: 1
    - require:
      - sls: bootstrap.packages.gpg

  pkg.installed:
    - version: {{ bootstrap_defaults['salt_minion_version'] }}
    - name: salt-minion
    - require:
      - sls: bootstrap.hostname

  host.only:
    - name: {{ pillar['salt_master_ip'] }}
    - hostnames: salt
