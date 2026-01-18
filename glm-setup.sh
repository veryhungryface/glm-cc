#!/bin/bash
# GLM Claude Code Setup Script for WSL
# 이 스크립트를 실행하면 자동으로 설치됩니다.

CLAUDE_DIR="$HOME/.claude"
ENV_FILE="$CLAUDE_DIR/.env_glm"
BASHRC="$HOME/.bashrc"

echo "🚀 GLM Claude Code 설치 시작..."

# 1. .claude 디렉토리 생성
mkdir -p "$CLAUDE_DIR"
echo "✅ 디렉토리 생성: $CLAUDE_DIR"

# 2. .env_glm 파일 생성
cat > "$ENV_FILE" << 'EOF'
GLM_API_KEY=your GLM api key
EOF
echo "✅ API 키 파일 생성: $ENV_FILE"

# 3. glm 함수를 .bashrc에 추가 (중복 방지)
if grep -q "# GLM Claude Code Function" "$BASHRC" 2>/dev/null; then
    echo "⚠️  glm 함수가 이미 .bashrc에 존재합니다. 건너뜁니다."
else
    cat >> "$BASHRC" << 'BASHRC_EOF'

# GLM Claude Code Function
glm() {
    echo -e "\033[36m🚀 GLM Environment Setup...\033[0m"
    
    ENV_FILE="$HOME/.claude/.env_glm"
    
    if [ -f "$ENV_FILE" ]; then
        GLM_API_KEY=$(grep "^GLM_API_KEY=" "$ENV_FILE" | cut -d'=' -f2)
    fi
    
    if [ -z "$GLM_API_KEY" ]; then
        echo -e "\033[31m❌ Error: GLM_API_KEY를 찾을 수 없습니다.\033[0m"
        return 1
    fi
    
    export ANTHROPIC_AUTH_TOKEN="$GLM_API_KEY"
    export ANTHROPIC_BASE_URL="https://api.z.ai/api/anthropic"
    
    echo -e "\033[32m✅ 환경변수 설정 완료\033[0m"
    echo -e "\033[33mANTHROPIC_BASE_URL: $ANTHROPIC_BASE_URL\033[0m"
    echo ""
    echo -e "\033[36m🤖 Starting Claude Code with GLM model...\033[0m"
    echo -e "\033[90m(종료: Ctrl+C 또는 'exit' 입력)\033[0m"
    echo ""
    
    claude --dangerously-skip-permissions
    
    unset ANTHROPIC_AUTH_TOKEN
    unset ANTHROPIC_BASE_URL
    echo -e "\033[32m✅ 환경변수 정리 완료 - 일반 Claude Code 사용 가능\033[0m"
}
BASHRC_EOF
    echo "✅ glm 함수를 .bashrc에 추가했습니다."
fi

echo ""
echo "🎉 설치 완료!"
echo ""
echo "📌 사용 방법:"
echo "   1. 터미널을 새로 열거나: source ~/.bashrc"
echo "   2. glm 명령어로 GLM 모델 사용"
echo "   3. claude 명령어로 일반 Claude Code 사용"
echo ""
