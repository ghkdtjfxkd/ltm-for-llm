# AI Task Protocol

> AI가 task를 처리할 때 따르는 기본 프로토콜 (라우팅 맵)

## 기본 원칙

1. **항상 current-state.md를 먼저 읽는다**
2. **작업 전후로 문서를 업데이트한다**
3. **불확실하면 사용자에게 묻는다**
4. **실패하면 롤백한다**

---

## Task 진행 흐름 (라우팅 맵)

### 1. Task 시작 전
→ **`progress/before-start.md`** 읽고 체크리스트 수행

### 2. Task 진행 중
→ **`progress/in-progress.md`** 참조하며 단계별 진행

### 3-A. Task 완료 시
→ **`progress/on-complete.md`** 절차 따라 완료 처리

### 3-B. Task 실패 시
→ **`progress/on-failure.md`** 절차 따라 롤백 및 기록

### 4. Task 분리 필요
→ **`progress/task-splitting.md`** 기준 확인하고 분리

---

## 추가 참고 문서

- **문서 업데이트**: `progress/doc-update.md`
- **특수 상황**: `progress/special-cases.md`

---

## 빠른 참조

| 상황 | 읽을 문서 |
|------|----------|
| Task 시작 | `progress/before-start.md` |
| Task 진행 | `progress/in-progress.md` |
| Task 완료 | `progress/on-complete.md` |
| Task 실패 | `progress/on-failure.md` |
| Task 분리 | `progress/task-splitting.md` |
| 문서 업데이트 | `progress/doc-update.md` |
| 특수 상황 | `progress/special-cases.md` |

---

## 기억할 것

**항상 current-state.md가 출발점이고 도착점이다.**
