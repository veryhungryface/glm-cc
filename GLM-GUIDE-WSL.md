# GLM Claude Code 사용 가이드 (WSL/Bash)

이 가이드는 **GLM 모델**과 **Claude Code(구독 버전)**를 WSL에서 쉽게 전환하여 사용하는 방법을 설명합니다.

---

## 🚀 설치 방법

### 1. WSL 터미널에서 설치 스크립트 실행

```bash
# 다운로드 폴더로 이동 (Windows 경로)
cd "/mnt/c/Users/TY/Downloads/새 폴더"

# 설치 스크립트 실행
bash glm-setup.sh

# 설정 적용
source ~/.bashrc
```

---

## 📌 사용 방법

### GLM 모델 사용
```bash
glm
```
- **기능**: GLM 모델로 Claude Code를 실행합니다.
- **동작**: 
  1. `~/.claude/.env_glm` 파일에서 API 키를 읽어옵니다.
  2. 실행 시 GLM API 환경변수가 자동으로 설정됩니다.
  3. 종료 시 환경변수가 **자동으로 제거**됩니다.

### 구독 버전 사용 (일반 모드)
```bash
claude
```
- **기능**: 일반적인 Claude Code(구독 버전)를 실행합니다.
- **동작**: 환경변수 없이 순정 상태로 실행됩니다.

---

## 📂 파일 위치

| 파일 | 경로 | 설명 |
|------|------|------|
| API 키 | `~/.claude/.env_glm` | GLM API 키 저장 |
| 설정 | `~/.bashrc` | glm 함수 정의 |

### API 키 변경 방법
```bash
nano ~/.claude/.env_glm
```
```properties
GLM_API_KEY=your_new_api_key_here
```

---

## 🛠️ 참고 사항

- **새 터미널**: 새 터미널을 열면 자동으로 `glm` 명령어를 사용할 수 있습니다.
- **설정 재적용**: `source ~/.bashrc` 명령어로 즉시 적용 가능합니다.

이제 어디서든 자유롭게 `glm`과 `claude`를 사용하세요! 🎉
