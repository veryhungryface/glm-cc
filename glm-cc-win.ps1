# GLM Claude Alias Setup Script
# Add this to your PowerShell profile: . $HOME\.claude\glm-claude-win.ps1

function Start-GLMClaude {
    Write-Host '🚀 GLM Environment Setup...' -ForegroundColor Cyan

    # .env_glm 파일 경로
    $envFile = "$HOME\.claude\.env_glm"

    # 파일 확인 및 API 키 읽기
    if (Test-Path $envFile) {
        $content = Get-Content $envFile
        foreach ($line in $content) {
            if ($line -match '^GLM_API_KEY=(.+)$') {
                $apiKey = $matches[1].Trim()
                break
            }
        }
    }

    if (-not $apiKey) {
        Write-Host "❌ Error: GLM_API_KEY를 찾을 수 없습니다: $envFile" -ForegroundColor Red
        return
    }

    # Set environment variables (current session only)
    $env:ANTHROPIC_AUTH_TOKEN = $apiKey
    $env:ANTHROPIC_BASE_URL = 'https://api.z.ai/api/anthropic'

    Write-Host '✅ 환경변수 설정 완료' -ForegroundColor Green
    Write-Host "ANTHROPIC_BASE_URL: $env:ANTHROPIC_BASE_URL" -ForegroundColor Yellow
    Write-Host ''
    Write-Host '🤖 Starting Claude Code with GLM model...' -ForegroundColor Cyan
    Write-Host "(종료: Ctrl+C 또는 'exit' 입력)" -ForegroundColor Gray
    Write-Host ''

    # Run Claude Code
    try {
        claude --dangerously-skip-permissions
    } finally {
        # Clean up environment variables on exit
        Write-Host ''
        Write-Host '🧹 환경변수 정리 중...' -ForegroundColor Cyan
        Remove-Item Env:\ANTHROPIC_AUTH_TOKEN -ErrorAction SilentlyContinue
        Remove-Item Env:\ANTHROPIC_BASE_URL -ErrorAction SilentlyContinue
        Write-Host '✅ 정리 완료 - 일반 Claude Code 사용 가능' -ForegroundColor Green
    }
}

# Create alias
Set-Alias -Name glm -Value Start-GLMClaude

Write-Host '✅ GLM alias 로드 완료. ''glm'' 명령어로 시작하세요.' -ForegroundColor Green
