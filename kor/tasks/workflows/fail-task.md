# Task 실패

> tasks 도메인 워크플로우: Task 실패 시 롤백 및 기록

## 입력

- Task 제목
- 실패 원인
- 롤백 필요 여부

## 절차

### 1. on-failure 절차 수행

`progress/on-failure.md` 참조.

### 2. 롤백 수행 (필요시)

```
변경한 파일 원상 복구
→ git restore {파일} 또는 수동 복구
```

### 3. current-state.md 업데이트

```markdown
## 완료된 작업

- [x] **{Task 제목}** ❌ 실패
  - 실패 일시: YYYY-MM-DD
  - 원인: {실패 원인}
  - 롤백: {롤백 내용 또는 "불필요"}
```

### 4. 출력

- 롤백 완료 확인
- 실패 원인 기록
- 사용자에게 보고
