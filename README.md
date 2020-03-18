# Ansible-for-Windows
Ansible for Windows (with docker for windows)

## Build

```bash
$ docker build -t ansible .
```

## Run

```ps1
# get linux path
function pwd_as_linux {
    "/$((Get-Location).Drive.Name.ToLowerInvariant())/$((Get-Location).Path.Replace('\', '/').Substring(3))"
}

# run ansible in docker
function ansible-playbook {
    docker run --rm -it --name="ansible" -v "$(pwd_as_linux):/workdir" ansible ansible-playbook (Split-Path $Args[0] -Leaf)
}
```
