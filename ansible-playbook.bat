@set "args=%*"
@powershell "iex((@('')*3+(cat '%~f0'|select -skip 3))-join[char]10)"
@exit /b %ERRORLEVEL%

docker run --rm -it --name="ansible" -v  "/$((Get-Location).Drive.Name.ToLowerInvariant())/$((Get-Location).Path.Replace('\', '/').Substring(3)):/workdir" akashisn/ansible ansible-playbook $env:args
