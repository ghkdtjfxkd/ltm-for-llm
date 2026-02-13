# Tasks Workflows

> Tasks 도메인의 내부 워크플로우들

## 역할

최상위 workflows에서 위임받은 task 관리 작업을 수행합니다.

## 포함된 워크플로우

### `create-task.md` (예정)
새로운 task를 생성하고 current-state.md에 기록

### `start-task.md` (예정)
Task 시작 전 체크리스트 수행
- `progress/before-start.md` 참조

### `execute-task.md` (예정)
Task 실행 중 가이드라인 제공
- `progress/in-progress.md` 참조

### `complete-task.md` (예정)
Task 완료 처리 및 문서 업데이트
- `progress/on-complete.md` 참조

### `fail-task.md` (예정)
Task 실패 시 롤백 및 기록
- `progress/on-failure.md` 참조

---

## 관계: workflows ↔ progress

```
workflows/           # 오케스트레이션 레벨
├── start-task.md   → progress/before-start.md (상세)
├── execute-task.md → progress/in-progress.md (상세)
├── complete-task.md → progress/on-complete.md (상세)
└── fail-task.md    → progress/on-failure.md (상세)

progress/            # 상세 문서
├── before-start.md  # 구체적 체크리스트
├── in-progress.md   # 진행 중 규칙
├── on-complete.md   # 완료 절차
└── on-failure.md    # 롤백 절차
```

---

## 사용 예시

최상위 `workflows/feature-development.md`에서:

```markdown
## 1. Task 생성

tasks 도메인에 위임:
→ tasks/workflows/create-task.md
  - Task 제목: "새 기능 개발"
  - 예상 단계: 5단계
```
