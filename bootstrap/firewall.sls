{% import_yaml slspath + '/files/bootstrap_defaults.yaml' as bootstrap_defaults %}

{% for rule in bootstrap_defaults['firewall_rules'] %}
rule_{{ rule }}:
  cmd.run:
  - name: {{ rule }}
{% endfor %}