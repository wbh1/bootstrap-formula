# My Bootstrap

## Prepping a node for Salt
1. Add the new host to `/etc/salt/roster` on the master
    - Preferably, use the internal IP for this
2. Use `salt-ssh` to do the initial minion configuring (run from Master)

```bash
salt-ssh -i '*' state.apply bootstrap.install-minion
```

## Apply the baselevel bootstrap
`salt '*' state.apply bootstrap`