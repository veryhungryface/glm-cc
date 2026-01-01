# GLM Claude Alias Setup Script
# Add this to your PowerShell profile: . C:\Users\BTY\.claude\glm-claude-alias.ps1

function Start-GLMClaude {
    Write-Host 'GLM Environment Setup...' -ForegroundColor Cyan

    # .env_glm              
    $envFile = 'C:\Users\BTY\.claude\.env_glm'

    #                Ȯ      API Ű  б 
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
        Write-Host ' Error: Could not find GLM_API_KEY in ' $envFile -ForegroundColor Red
        return
    }

    # Set environment variables (current session only)
    $env:ANTHROPIC_AUTH_TOKEN = $apiKey
    $env:ANTHROPIC_BASE_URL = 'https://api.z.ai/api/anthropic'

    Write-Host 'Environment variables set' -ForegroundColor Green
    Write-Host ('ANTHROPIC_BASE_URL: ' + $env:ANTHROPIC_BASE_URL) -ForegroundColor Yellow
    Write-Host ''
    Write-Host 'Starting Claude Code with GLM4.7 model...' -ForegroundColor Cyan
    Write-Host '(Press Ctrl+C or type ''exit'' to quit)' -ForegroundColor Gray
    Write-Host ''

    # Run Claude Code
    try {
        claude --dangerously-skip-permissions
    } finally {
        # Clean up environment variables on exit
        Write-Host ''
        Write-Host 'Cleaning up environment variables...' -ForegroundColor Cyan
        Remove-Item Env:\ANTHROPIC_AUTH_TOKEN -ErrorAction SilentlyContinue
        Remove-Item Env:\ANTHROPIC_BASE_URL -ErrorAction SilentlyContinue
        Write-Host 'Environment cleaned - Regular Claude Code ready' -ForegroundColor Green
    }
}

# Create alias
Set-Alias -Name glm -Value Start-GLMClaude

Write-Host 'GLM-Claude Code alias loaded. Use ''glm'' command to start.' -ForegroundColor Green
