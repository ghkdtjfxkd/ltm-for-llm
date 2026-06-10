# Bug Fixing Workflow

> 버그 수정 워크플로우 (오케스트레이터)

## 목적

버그를 재현하고, 원인을 파악하고, 수정 후 검증하는 전체 프로세스를 관리합니다.

---

## 전체 흐름

```
1. Task 생성 (tasks 위임)
2. 버그 재현 및 원인 파악
3. Troubleshooting 조회 (memory 위임)
4. 관련 아키텍처 확인 (memory 위임)
5. 수정 구현
6. 검증
7. Task 완료 (tasks 위임)
```

---

## 1. Task 생성

**도메인 위임**: `tasks/`

```
→ tasks/entry.md → workflows/create-task.md
  입력:
    - Task 제목: "버그 수정: {버그 설명}"
    - 완료 조건: 버그 재현 불가 + 기존 기능 정상
```

---

## 2. 버그 재현 및 원인 파악

**로컬 실행**:
1. 버그 재현 조건 정리
2. 에러 메시지/로그 수집
3. 예상 원인 가설 수립

---

## 3. Troubleshooting 조회

**도메인 위임**: `memory/`

```
→ memory/entry.md → workflows/get-knowledge.md
  입력:
    - 카테고리: troubleshooting
    - 키워드: [에러 메시지, 관련 모듈]
  출력:
    - 유사 사례 및 해결 방법
```

---

## 4. 관련 아키텍처 확인

**도메인 위임**: `memory/`

```
→ memory/entry.md → workflows/get-knowledge.md
  입력:
    - 카테고리: architecture
    - 키워드: [버그 발생 모듈]
  출력:
    - 해당 모듈 구조 파악
    - 수정 영향 범위 확인
```

---

## 5. 수정 구현

**로컬 실행**:
1. 최소한의 변경으로 수정
2. 영향 범위 재확인

---

## 6. 검증

**로컬 실행**:
1. 버그 재현 안 됨 확인
2. 기존 기능 정상 동작 확인
3. 새로운 지식이 생겼으면 memory에 추가

---

## 7. Task 완료

**도메인 위임**: `tasks/`

```
→ tasks/entry.md → workflows/complete-task.md
```
