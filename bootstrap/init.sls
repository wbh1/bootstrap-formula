{% import_yaml slspath + '/files/bootstrap_defaults.yaml' as bootstrap_defaults %}

{{ bootstrap_defaults['username'] }}:
  user.present:
    - shell: /bin/bash
    - home: /home/{{ bootstrap_defaults['username'] }}
    - groups:
      - sudo
    - usergroup: True
    - password: {{ pillar['password_hash'] }}

? AAAAB3NzaC1yc2EAAAADAQABAAACAQDrU8eqI1wsmuvi4DmJQqs3jNCeIX2Jrvy6BMXpZ/NdPqi+SMD8cM5RBKFpDIpu6ar9+9EST2AqUiJ32oon5x53qiYH1RlaBj78Bj4HwuIfz7k12dcQVa2UEG5Yrv1QGeSbB9EKoQLbN6JYsnC5Go+0itQnlAX5j5Fxc2Wq6WlGea9sXSN5Fe51+F22oe9WGuXXL7Q0XyBt8g3XkCAS1QVsLc08a6un+2zGk//eo5XbVh41+iqJgDOrkrItoX6pct+cYHOoC5YZbWEcWqXDbnDRqZisjFTGmh6IMQ7TfscEpaoKfBhqYHkw3vNVfuG65hEJVJ6BLYhKMxWnNhnDQfNDz0xph2nk6IJXccVMAl0GUNYryPQsRpRvRa3GO+EQhP4EZGTXV6bqE3dpsOEGHNUIcYC91Uq+wXzwkY0KiITvQ/zcpJ87K0SlpIkP9P0uS/KXzfBARtstc7LhH17SphGQz1SrDvHEcyWdQkqpmYZradSfe8KSpDX51i6+R4Yuijmn4zDxS+t8ZtldQFalsdVPT5eyWu+HzwqKlqDbkqpgnqQSVxoky7xS2nzRcmaaQDp7wcVJwfxUKKUx0cvSSyIOr2buCvl/JAIElE/CbDAs06fAHbJBLWi7ZMqGFTEbGzmdHx3xNETDKMRgQH33+MF69/ZxX6iiDAbS6EmF+V13/Q== whegedus@whegedus-C02FM7R0MD6M
:
  ssh_auth.present:
    - user: {{ bootstrap_defaults['username'] }}
    - enc: ssh-rsa

include:
  - openssh.config
  - .packages
  - .firewall