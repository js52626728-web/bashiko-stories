$repoPath = "C:\Users\shibata\OneDrive\デスクトップ\bashiko-stories"
$sshKey = "C:/Users/shibata/OneDrive/デスクトップ/ccbooster/.claude/ssh/bashiko-stories"

Set-Location $repoPath
$env:GIT_SSH_COMMAND = "ssh -i `"$sshKey`" -o StrictHostKeyChecking=no"

$status = git status --porcelain
if (-not $status) {
    Write-Host "upload file ga arimasen" -ForegroundColor Yellow
    Read-Host "Enter wo oshite kudasai"
    exit
}

Write-Host "upload shimasu:" -ForegroundColor Cyan
git status --short
git add .
$date = Get-Date -Format "yyyy-MM-dd"
git commit -m "Add files $date"
git pull origin main --rebase
git push origin main
Write-Host "kanryo!" -ForegroundColor Green
Read-Host "Enter wo oshite kudasai"