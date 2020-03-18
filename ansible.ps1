# get linux path
function pwd_as_linux {
    "/$((Get-Location).Drive.Name.ToLowerInvariant())/$((Get-Location).Path.Replace('\', '/').Substring(3))"
}

# run ansible in docker
function ansible {
    docker run --rm -it --name="ansible" -v "$(pwd_as_linux):/workdir" ansible (Split-Path $Args[0] -Leaf)
}