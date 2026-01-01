# GLM Claude Code 통합 가이드

**GLM4.7** 모델을 **Claude Code**에 적용하여 사용하는 방법입니다.  
PowerShell(Windows)과 WSL(Linux/Bash) 환경 모두 지원합니다.

---

## 📦 파일 구성

| 파일 | 용도 |
|------|------|
| `glm-claude-alias.ps1` | PowerShell용 설치 스크립트 |
| `glm-setup.sh` | WSL/Bash용 설치 스크립트 |
| `.env_glm` | API 키 저장 파일 |

---

## 🖥️ PowerShell (Windows) 설치

### 1. 파일 복사
```powershell
# .claude 폴더 생성 및 파일 복사
mkdir ~\.claude -Force
Copy-Item .env_glm ~\.claude\
Copy-Item glm-claude-alias.ps1 ~\.claude\
```

### 2. PowerShell 프로필에 추가
```powershell
# 프로필 파일 열기
notepad $PROFILE

# 아래 내용 추가 후 저장
. $HOME\.claude\glm-claude-alias.ps1
```

### 3. 사용
```powershell
glm      # GLM4.7 모델로 Claude Code 실행
claude   # 일반 Claude Code (구독 버전) 실행
```

---

## 🐧 WSL/Linux (Bash) 설치

### 1. 설치 스크립트 실행
```bash
# 스크립트가 있는 폴더로 이동
cd "/mnt/c/Users/TY/Downloads/새 폴더"

# 설치 실행 (자동으로 모든 설정 완료)
bash glm-setup.sh

# 설정 적용
source ~/.bashrc
```

### 2. 사용
```bash
glm      # GLM4.7 모델로 Claude Code 실행
claude   # 일반 Claude Code (구독 버전) 실행
```

---

## 🔑 API 키 변경

### PowerShell
```powershell
notepad ~\.claude\.env_glm
```

### WSL/Bash
```bash
nano ~/.claude/.env_glm
```

파일 내용:
```properties
GLM_API_KEY=your_api_key_here
```

---

## ⚙️ 동작 원리

`glm` 명령어 실행 시:
1. `.env_glm`에서 API 키 로드
2. 환경변수 설정:
   - `ANTHROPIC_AUTH_TOKEN` = API 키
   - `ANTHROPIC_BASE_URL` = `https://api.z.ai/api/anthropic`
3. Claude Code 실행
4. 종료 시 환경변수 자동 정리

---

## 📌 참고 사항

- **새 터미널**에서 자동으로 `glm` 명령어 사용 가능
- **구독 버전**과 **GLM 버전** 자유롭게 전환 가능
- 다른 컴퓨터에 적용 시 해당 OS용 설치 스크립트만 실행하면 됨

---

🎉 이제 `glm`과 `claude`를 자유롭게 사용하세요!
