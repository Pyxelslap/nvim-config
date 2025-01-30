## depedencies you need to install this config on different platforms
### android
- software
'pkg install git && pkg install lua-language-server && pkg install nodejs'
optional:
'pkg install wakatime-cli'[^1]

### windows
- software
'winget install --id Git.Git -e --source winget'
or just download it from [here](https://git-scm.com/downloads/win)


[^1]: if you don't want wakatime installed on your system, you can remove it in 'lua/plugins/qualityoflife.lua'
