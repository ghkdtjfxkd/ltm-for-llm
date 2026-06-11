# Onboarding Workflow

> 새 프로젝트에 LTM을 붙일 때의 초기 설정 워크플로우 (오케스트레이터)

## 목적

새로운 프로젝트에 LTM을 처음 도입할 때 `memory/domain-knowledge/`를
비롯한 핵심 메모리 영역을 체계적으로 채우는 전체 프로세스를 관리합니다.

---

## 전체 흐름

```
1. Task 생성 (tasks 위임)
2. 프로젝트 기본 정보 수집
3. 아키텍처 지식 초기화 (memory 위임)
4. 도메인 지식 초기화 (memory 위임)
5. 컨벤션 지식 초기화 (memory 위임)
6. 라우팅 맵 검증
7. Task 완료 (tasks 위임)
```

---

## 1. Task 생성

**도메인 위임**: `tasks/`

```
→ tasks/entry.md → workflows/create-task.md
  입력:
    - Task 제목: "LTM 온보딩: {프로젝트명}"
    - 완료 조건: 핵심 메모리 영역 채워짐 + 라우팅 검증 통과
```

---

## 2. 프로젝트 기본 정보 수집

**로컬 실행**:

아래 질문에 답하며 이후 단계에서 사용할 정보를 정리합니다.

```
1. 이 프로젝트는 무엇을 하는 시스템인가?
2. 주요 기술 스택은 무엇인가?
3. 핵심 도메인 개념/용어는 무엇인가?
4. 팀이 지키는 코딩 규칙이 있는가?
5. 자주 발생하는 문제 패턴이 있는가?
```

---

## 3. 아키텍처 지식 초기화

**도메인 위임**: `memory/`

```
→ memory/entry.md → memory/workflows/add-knowledge.md
  입력:
    - 카테고리: architecture
    - 내용: 시스템 구조, 주요 컴포넌트, 데이터 흐름
  출력:
    - memory/architecture/ 아래 문서 생성
```

**채워야 할 최소 내용**:
- 시스템 전체 구조 개요
- 주요 모듈/컴포넌트 목록과 역할
- 외부 의존성 (DB, API, 서비스)
- 데이터 흐름 또는 요청 처리 흐름

---

## 4. 도메인 지식 초기화

**도메인 위임**: `memory/`

```
→ memory/entry.md → memory/workflows/add-knowledge.md
  입력:
    - 카테고리: domain-knowledge
    - 내용: 용어 사전, 비즈니스 규칙, 도메인 개념
  출력:
    - memory/domain-knowledge/ 아래 문서 생성
```

**채워야 할 최소 내용**:
- 도메인 용어 사전 (코드에 등장하는 비즈니스 용어)
- 핵심 비즈니스 규칙 (예외 케이스, 제약 조건)
- 주요 엔티티와 관계

**팁**: 용어 사전은 가장 먼저 채울 것.
LLM이 코드를 읽을 때 도메인 용어를 잘못 해석하면 모든 판단이 틀어집니다.

---

## 5. 컨벤션 지식 초기화

**도메인 위임**: `memory/`

```
→ memory/entry.md → memory/workflows/add-knowledge.md
  입력:
    - 카테고리: conventions
    - 내용: 코딩 스타일, 네이밍 규칙, 파일 구조 규칙
  출력:
    - memory/conventions/ 아래 문서 생성
```

**채워야 할 최소 내용**:
- 네이밍 규칙 (파일명, 변수명, 함수명)
- 코드 스타일 (포맷터 설정, 린트 규칙)
- PR/커밋 규칙
- 디렉토리 구조 규칙

---

## 6. 라우팅 맵 검증

**로컬 실행**:

채워진 메모리와 라우팅이 연결되어 있는지 확인합니다.

- [ ] `memory/architecture/overview.md` 파일 목록이 실제 파일과 일치하는가?
- [ ] `memory/domain-knowledge/overview.md` 파일 목록이 실제 파일과 일치하는가?
- [ ] `memory/conventions/overview.md` 파일 목록이 실제 파일과 일치하는가?
- [ ] `routing/main-routing-map.md`에서 워크플로우 경로가 유효한가?
- [ ] `lint-refs.sh` 실행 결과가 "all references OK"인가?

---

## 7. Task 완료

**도메인 위임**: `tasks/`

```
→ tasks/entry.md → workflows/complete-task.md
  입력:
    - Task 제목
    - 생성된 메모리 파일 목록
    - 완료 요약
```

---

## 채우는 순서 권장

```
domain-knowledge/ (용어 사전) 먼저
    ↓
architecture/ (구조 파악)
    ↓
conventions/ (규칙 정리)
    ↓
patterns/, troubleshooting/ (필요할 때 추가)
```

`domain-knowledge/`를 먼저 채워야 이후 문서 작성 시 용어 혼동이 없습니다.

---

## 주의사항

- 한 번에 완벽하게 채우려 하지 말 것. 프로젝트를 진행하며 점진적으로 보완.
- 각 카테고리 문서는 짧고 집중적으로 (파편화 원칙 적용).
- 새 지식을 배울 때마다 `memory/workflows/add-knowledge.md`로 즉시 추가.
