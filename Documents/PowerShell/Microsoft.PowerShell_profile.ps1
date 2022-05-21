# auto completion
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineOption -HistoryNoDuplicates
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord # like fish
Set-PSReadLineKeyHandler -Chord "Tab" MenuComplete

function ~ {  cd ~  }
function .. { cd .. }
function epl {explorer.exe .}


# starship
# change window name
function Invoke-Starship-PreCommand {
  $ParentFolder = Split-Path $PWD -Leaf
  $host.ui.Write("`e]0; $ParentFolder `a")
}
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"

# for chezmoi
$Editor = "C:\Users\Owner\AppData\Local\Programs\Microsoft VS Code\Code.exe"

# oh my posh
# oh-my-posh --init --shell pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/capr4n.omp.json | Invoke-Expression

# enable ssh-agent
#sudo Set-Service -Name ssh-agent -StartupType Manual | Start-Service ssh-agent

# chezmoi completion
$script = "$HOME\.config\powershell\chezmoi_completion.ps1"
if (Test-Path $script) {
  . $script
}