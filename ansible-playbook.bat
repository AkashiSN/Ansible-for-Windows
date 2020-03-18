@powershell -NoProfile -ExecutionPolicy RemoteSigned "&([ScriptBlock]::Create((cat -encoding utf8 \"%~f0\" | ? {$_.ReadCount -gt 2}) -join \"`n\"))" %*
@exit /b

docker run --rm -it --name="ansible" -v  "/$((Get-Location).Drive.Name.ToLowerInvariant())/$((Get-Location).Path.Replace('\', '/').Substring(3)):/workdir" akashisn/ansible ansible-playbook (Split-Path $Args[0] -Leaf)
