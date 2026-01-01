# GLM Claude Code 사용 가이드

이 프로젝트는 **GLM4.7**과 **Claude Code(구독 버전)**를 쉽게 전환하여 사용할 수 있도록 설정되어 있습니다.
이 설정은 **전역(Global)**으로 적용되어, 어떤 프로젝트 폴더에서든 사용할 수 있습니다.

---

## 🚀 사용 방법

### 1. GLM 버전 사용
```powershell
glm
```
- **기능**: GLM4.7 모델로 Claude Code를 실행합니다.
- **동작**: 
  1. `.env_glm` 파일에서 API 키를 읽어옵니다.
  2. 실행 시 GLM API 환경변수가 자동으로 설정됩니다.
  3. 종료 시 환경변수가 **자동으로 제거**됩니다.

### 2. 구독 버전 사용 (일반 모드)
```powershell
claude
```
- **기능**: 일반적인 Claude Code(구독 버전)를 실행합니다.
- **동작**: 환경변수 없이 순정 상태로 실행됩니다.

---

## 📂 파일 위치 및 설정

### 1. API 키 관리 (중요!) 🔑
- **파일 위치**: `C:\Users\BTY\.claude\.env_glm`
- **내용 형식**:
  ```properties
  GLM_API_KEY=your_api_key_here
  ```
- API 키를 변경하려면 이 파일만 수정하면 됩니다.

### 2. 스크립트 및 설정
- **스크립트**: `C:\Users\BTY\.claude\glm-claude-alias.ps1`
- **프로필 설정**: `C:\Users\BTY\Documents\WindowsPowerShell\profile.ps1`

---

## 🛠️ 참고 사항

- **새 터미널**: 파워쉘을 새로 열면 자동으로 `glm` 명령어를 사용할 수 있습니다.
- **환경변수 주의**: 각 프로젝트의 `.claude/settings.json`에 환경변수 설정이 없어야 합니다(빈 객체 `{}`).

이제 어디서든 자유롭게 `glm`과 `claude`를 사용하세요! 🎉
