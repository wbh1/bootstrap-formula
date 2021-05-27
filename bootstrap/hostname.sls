set hostname:
  network.system:
    - hostname: {{ grains['id'] }}.{{ bootstrap_defaults['domain'] }}
    - apply_hostname: yes
    - retain_settings: yes
    - enabled: yes

  host.present:
    - ip:
      - 127.0.0.1
      - ::1
    - names:
      - {{ grains['id'] }}.{{ bootstrap_defaults['domain'] }}
      - {{ grains['id'] }}
      - localhost
  