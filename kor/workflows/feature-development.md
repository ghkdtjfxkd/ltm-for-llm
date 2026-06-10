# Feature Development Workflow

> 새 기능 개발 워크플로우 (오케스트레이터)

## 목적

새로운 기능을 처음부터 완성까지 체계적으로 개발하는 전체 프로세스를 관리합니다.

---

## 전체 흐름

```
1. Task 생성 (tasks 위임)
2. 아키텍처 확인 (memory 위임)
3. 관련 패턴 조회 (memory 위임)
4. 기능 구현
5. 문서 업데이트 (document-management 위임)
6. Task 완료 (tasks 위임)
```

---

## 1. Task 생성

**도메인 위임**: `tasks/`

```
→ tasks/entry.md → workflows/create-task.md
  입력:
    - Task 제목: "기능명 개발"
    - 예상 단계: [아키텍처 확인, 구현, 테스트, 문서화]
  출력:
    - current-state.md에 Task 기록됨
```

---

## 2. 아키텍처 확인

**도메인 위임**: `memory/`

```
→ memory/entry.md → workflows/get-knowledge.md
  입력:
    - 카테고리: architecture
    - 키워드: [시스템 구조, 관련 모듈]
  출력:
    - 현재 아키텍처 파악
    - 새 기능 위치 결정
```

---

## 3. 패턴 조회

**도메인 위임**: `memory/`

```
→ memory/entry.md → workflows/get-knowledge.md
  입력:
    - 카테고리: patterns
    - 키워드: [관련 패턴명]
  출력:
    - 재사용 가능한 패턴
    - 구현 참고 자료
```

---

## 4. 기능 구현

**로컬 실행**:
1. 아키텍처 결정 사항 반영
2. 관련 패턴 적용
3. 컨벤션 준수 (`memory/conventions/` 참조)

---

## 5. 문서 업데이트

**도메인 위임**: `document-management.md`

```
새 기능에 대한 문서가 필요하면:
→ document-management.md 실행
  입력:
    - 문서 타입: memory 또는 workflow
    - 내용: 새 기능 관련 지식
```

---

## 6. Task 완료

**도메인 위임**: `tasks/`

```
→ tasks/entry.md → workflows/complete-task.md
  입력:
    - Task 제목
    - 변경 파일 목록
    - 완료 요약
  출력:
    - current-state.md 업데이트됨
```

---

## 주의사항

- 아키텍처 확인을 건너뛰지 말 것 (나중에 리팩토링 비용 발생)
- 구현 중 새 패턴 발견 시 memory에 추가
- Task는 반드시 완료 처리할 것
