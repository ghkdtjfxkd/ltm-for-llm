# Refactoring Workflow

> 리팩토링 워크플로우 (오케스트레이터)

## 목적

기능 변경 없이 코드 구조를 개선하는 전체 프로세스를 관리합니다.

---

## 전체 흐름

```
1. Task 생성 (tasks 위임)
2. 현재 구조 파악 (memory 위임)
3. 패턴 및 컨벤션 확인 (memory 위임)
4. 리팩토링 범위 결정
5. 단계적 변경 수행
6. 검증
7. Task 완료 (tasks 위임)
```

---

## 1. Task 생성

**도메인 위임**: `tasks/`

```
→ tasks/entry.md → workflows/create-task.md
  입력:
    - Task 제목: "리팩토링: {대상}"
    - 완료 조건: 기능 동일 + 코드 개선
```

---

## 2. 현재 구조 파악

**도메인 위임**: `memory/`

```
→ memory/entry.md → workflows/get-knowledge.md
  입력:
    - 카테고리: architecture
    - 키워드: [리팩토링 대상 모듈]
```

---

## 3. 패턴 및 컨벤션 확인

**도메인 위임**: `memory/`

```
→ memory/entry.md → workflows/get-knowledge.md
  입력:
    - 카테고리: patterns, conventions
    - 키워드: [적용할 패턴]
```

---

## 4. 리팩토링 범위 결정

**로컬 판단**:
- 영향 범위가 크면 → `tasks/progress/task-splitting.md` 참조
- 단계적으로 작게 나눌 것

---

## 5. 단계적 변경 수행

**로컬 실행**:
1. 한 번에 하나의 변경
2. 각 변경 후 기능 동작 확인
3. 새로운 패턴 발견 시 memory에 추가

---

## 6. 검증

- 기능 동일 확인
- 구조 개선 확인

---

## 7. Task 완료

**도메인 위임**: `tasks/`

```
→ tasks/entry.md → workflows/complete-task.md
```
