# Tasks 도메인 라우팅

> Tasks 도메인 내부의 라우팅 맵

## 기본 원칙

이 라우팅 맵은 **tasks 도메인 내부**에서만 사용됩니다.
최상위 workflows에서 위임받은 작업을 수행할 때 참조합니다.

---

## 상황별 라우팅

### Task 생성

**상황**: 새로운 task 생성
**워크플로우**: `workflows/create-task.md`

### Task 시작

**상황**: Task 시작 준비
**워크플로우**: `workflows/start-task.md`
**참조**: `progress/before-start.md`

### Task 진행

**상황**: Task 수행 중
**워크플로우**: `workflows/execute-task.md`
**참조**: `progress/in-progress.md`

### Task 완료

**상황**: Task 완료 처리
**워크플로우**: `workflows/complete-task.md`
**참조**: `progress/on-complete.md`

### Task 실패

**상황**: Task 실패 시 롤백
**워크플로우**: `workflows/fail-task.md`
**참조**: `progress/on-failure.md`

---

## 빠른 참조

| 작업 | 워크플로우 | 상세 문서 |
|------|-----------|----------|
| Task 생성 | `workflows/create-task.md` | - |
| Task 시작 | `workflows/start-task.md` | `progress/before-start.md` |
| Task 진행 | `workflows/execute-task.md` | `progress/in-progress.md` |
| Task 완료 | `workflows/complete-task.md` | `progress/on-complete.md` |
| Task 실패 | `workflows/fail-task.md` | `progress/on-failure.md` |
