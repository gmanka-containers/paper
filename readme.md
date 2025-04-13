# paper container

to run this container, ensure you have `systemd` and `podman` installed

minimal podman version is 4.4

you should put [paper.container](https://github.com/gmanka-containers/paper/blob/main/paper.container) file to `~/.config/containers/systemd/paper.container`

```shell
curl https://raw.githubusercontent.com/gmanka-containers/paper/refs/heads/main/paper.container -Lo ~/.config/containers/systemd/paper.container

systemctl --user daemon-reload
systemctl --user start paper
systemctl --user status paper
```

