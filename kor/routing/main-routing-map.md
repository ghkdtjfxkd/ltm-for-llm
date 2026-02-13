# Main Routing Map

> 최상위 오케스트레이터: 상황별 워크플로우 라우팅

## 역할

사용자 요청이나 상황을 분석하여 적절한 **최상위 workflow**로 라우팅합니다.

이것은 시스템의 **진입점 라우터**입니다.

---

## 기본 흐름

```
사용자 요청
    ↓
meta/ (시작점)
    ↓
routing/main-routing-map.md (이 문서)
    ↓
workflows/{적절한-workflow}.md (오케스트레이터)
    ↓
하위 도메인들에 작업 위임
```

---

## 상황별 라우팅

### 새 기능 개발

**상황**: "새로운 기능을 개발하고 싶어요"
**라우팅**: `workflows/feature-development.md`

**위임 예상**:
- tasks/ : Task 생성 및 관리
- memory/ : 아키텍처 및 패턴 조회
- templates/ : 코드 템플릿 가져오기

---

### 버그 수정

**상황**: "버그를 고쳐야 해요"
**라우팅**: `workflows/bug-fixing.md`

**위임 예상**:
- tasks/ : Task 생성
- memory/ : Troubleshooting 조회
- memory/ : 관련 아키텍처 확인

---

### 문서 추가/수정

**상황**: "문서를 추가하거나 수정해야 해요"
**라우팅**: `workflows/document-management.md`

**위임 예상**:
- tasks/ : Task 생성
- templates/ : 문서 템플릿 가져오기
- memory/ : 문서 작성 규칙 확인

---

### 리팩토링

**상황**: "코드를 리팩토링하고 싶어요"
**라우팅**: `workflows/refactoring.md`

**위임 예상**:
- tasks/ : Task 생성
- memory/ : 패턴 및 규칙 조회
- memory/ : 아키텍처 확인

---

## 빠른 참조 테이블

| 상황 | 워크플로우 | 주요 도메인 |
|------|-----------|------------|
| 새 기능 개발 | `workflows/feature-development.md` | tasks, memory, templates |
| 버그 수정 | `workflows/bug-fixing.md` | tasks, memory |
| 문서 관리 | `workflows/document-management.md` | tasks, templates, memory |
| 리팩토링 | `workflows/refactoring.md` | tasks, memory |

---

## 확장 방법

새로운 상황 추가 시:

1. 이 문서에 새 상황 추가
2. `workflows/`에 새 워크플로우 작성
3. 워크플로우에서 필요한 도메인 위임 정의

---

## 주의사항

- 이 라우팅 맵은 **최상위 워크플로우**로만 연결
- 하위 도메인 내부 라우팅은 각 도메인의 routing/ 참조
- 애매한 경우: meta/system-overview.md 다시 확인
