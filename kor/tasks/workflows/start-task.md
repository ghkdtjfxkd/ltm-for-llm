# Task 시작

> tasks 도메인 워크플로우: Task 시작 전 체크리스트 수행

## 입력

- Task 제목 (current-state.md에 기록된 것)

## 절차

### 1. before-start 체크리스트 수행

`progress/before-start.md` 참조:

- [ ] current-state.md 읽음
- [ ] 진행 중 Task 없음 확인
- [ ] 필요한 문서 파악
- [ ] Task 분리 필요 여부 판단
- [ ] current-state.md에 "진행 중" 표시

### 2. Task 분리 판단

```
3단계 이상? → progress/task-splitting.md 참조
여러 파일 수정? → progress/task-splitting.md 참조
30분 이상? → progress/task-splitting.md 참조
```

### 3. 출력

- 시작 준비 완료
- 필요한 참조 문서 목록

## 다음 단계

→ `execute-task.md`로 진행 (실제 작업 수행)
