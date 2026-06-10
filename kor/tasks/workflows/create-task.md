# Task 생성

> tasks 도메인 워크플로우: 새 Task를 생성하고 기록

## 입력

- Task 제목
- Task 설명 (목표, 완료 조건)
- 예상 단계 (선택)

## 절차

### 1. 현재 상태 확인

```
current-state.md 읽기
→ 진행 중인 Task가 있으면 먼저 처리
→ 없으면 새 Task 생성 진행
```

### 2. current-state.md 업데이트

```markdown
## 진행 중인 작업

### {Task 제목}

- 목표: {설명}
- 시작: YYYY-MM-DD
- 단계:
  - [ ] 단계 1
  - [ ] 단계 2
```

### 3. 출력

- Task가 current-state.md에 기록됨
- 작업 시작 준비 완료

## 다음 단계

→ `start-task.md`로 진행
