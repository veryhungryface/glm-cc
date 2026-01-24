# GLM Claude Code - Windows 설치 스크립트

$claudeDir = "$HOME\.claude"

Write-Host "🚀 GLM Claude Code 설치 시작..." -ForegroundColor Cyan

# 1. .claude 폴더 생성
New-Item -Path $claudeDir -ItemType Directory -Force | Out-Null
Write-Host "✅ 디렉토리 생성: $claudeDir" -ForegroundColor Green

# 2. API 키 입력받기
$apiKey = Read-Host "🔑 GLM_API_KEY를 입력하세요"
if ([string]::IsNullOrEmpty($apiKey)) {
    Write-Host "❌ API 키가 입력되지 않았습니다." -ForegroundColor Red
    exit 1
}
"GLM_API_KEY=$apiKey" | Out-File "$claudeDir\.env_glm" -Encoding UTF8
Write-Host "✅ API 키 저장 완료" -ForegroundColor Green

# 3. alias 스크립트 다운로드
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/veryhungryface/glm-cc/main/glm-cc-win.ps1" -OutFile "$claudeDir\glm-cc-win.ps1"
Write-Host "✅ 스크립트 다운로드 완료" -ForegroundColor Green

# 4. PowerShell 프로필에 등록
if (!(Test-Path $PROFILE)) { New-Item -Path $PROFILE -ItemType File -Force | Out-Null }
if (!(Select-String -Path $PROFILE -Pattern "glm-cc-win" -Quiet)) {
    Add-Content -Path $PROFILE -Value "`n. `$HOME\.claude\glm-cc-win.ps1"
    Write-Host "✅ 프로필에 등록 완료" -ForegroundColor Green
} else {
    Write-Host "⚠️ 이미 프로필에 등록되어 있습니다" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🎉 설치 완료! 터미널 재시작 후 'glm' 명령어를 사용하세요" -ForegroundColor Green
