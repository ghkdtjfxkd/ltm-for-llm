# Task 실행

> tasks 도메인 워크플로우: Task 수행 중 가이드라인

## 입력

- Task 제목 (current-state.md에 기록된 것)
- 현재 단계

## 절차

### 1. in-progress 규칙 준수

`progress/in-progress.md` 참조:

- [ ] 단계별로 진행
- [ ] 필요한 문서 참조
- [ ] 중요 결정 기록

### 2. 단계 완료 시 체크

```markdown
- [x] 완료된 단계
- [ ] 다음 단계  ← 현재 위치
```

current-state.md의 단계 체크리스트를 업데이트합니다.

### 3. 막힘/의문 발생 시

`progress/special-cases.md` → "불확실한 경우" 참조

## 다음 단계

- 성공 → `complete-task.md`
- 실패 → `fail-task.md`
- Task 너무 큼 → `progress/task-splitting.md`
