# GLM Claude Code 통합 가이드

**GLM** 모델을 **Claude Code**에 적용하여 사용하는 방법입니다.  
PowerShell(Windows)과 WSL(Linux/Bash) 환경 모두 지원합니다.

---

## ⚠️ 사전 요구사항
> **Claude Code**가 먼저 설치되어 있어야 합니다.
### Claude Code 설치 (WSL/Linux/macOS)
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

---

## 📦 파일 구성

| 파일 | 용도 |
|------|------|
| `glm-cc-install-win.ps1` | PowerShell용 설치 스크립트 |
| `glm-cc-win.ps1` | PowerShell용 설치 의존 스크립트 |
| `glm-cc-install-linux.sh` | WSL/Bash용 설치 스크립트 |

---

## 🖥️ PowerShell (Windows) 설치

```powershell
iwr https://raw.githubusercontent.com/veryhungryface/glm-cc/main/glm-cc-install-win.ps1 -OutFile $env:TEMP\i.ps1; & $env:TEMP\i.ps1
```
---

## 🐧 WSL/Linux (Bash) 설치

```bash
curl -fsSLo /tmp/g.sh https://raw.githubusercontent.com/veryhungryface/glm-cc/main/glm-cc-install-linux.sh && bash /tmp/g.sh && source ~/.bashrc
```

---

## ⌨️ 사용
```bash
glm      # GLM 모델로 Claude Code 실행
```
```bash
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


## 📌 참고 사항

- **새 터미널**에서 자동으로 `glm` 명령어 사용 가능
- **구독 버전**과 **GLM 버전** 자유롭게 전환 가능
- 다른 컴퓨터에 적용 시 해당 OS용 설치 스크립트만 실행하면 됨

---

🎉 이제 `glm`과 `claude`를 자유롭게 사용하세요!










