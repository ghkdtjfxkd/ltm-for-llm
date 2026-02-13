# Document Management Workflow

> 문서 추가 및 수정 워크플로우 (오케스트레이터)

## 목적

LTM 시스템에 새로운 문서를 추가하거나 기존 문서를 수정하는 전체 프로세스를 관리합니다.

---

## 전체 흐름

```
1. Task 생성 (tasks 위임)
2. 문서 타입 파악
3. 템플릿 가져오기 (templates 위임)
4. 작성 규칙 확인 (memory 위임)
5. 문서 작성/수정
6. 관련 문서 동기화 확인 (routing 참조)
7. Task 완료 (tasks 위임)
```

---

## 1. Task 생성

**도메인 위임**: `tasks/`

```
→ tasks/workflows/create-task.md
  입력:
    - Task 제목: "문서 추가/수정"
    - 설명: [문서 경로, 목적]
  출력:
    - Task ID
    - current-state.md 업데이트됨
```

---

## 2. 문서 타입 파악

**로컬 판단**:
- overview 문서?
- workflow 문서?
- memory 문서?
- routing 문서?
- 기타?

→ 타입에 따라 적절한 템플릿 선택

---

## 3. 템플릿 가져오기

**도메인 위임**: `templates/`

```
→ templates/workflows/get-template.md
  입력:
    - 타입: [workflow/memory/routing/등]
  출력:
    - 템플릿 내용
    - 작성 가이드
```

---

## 4. 작성 규칙 확인

**도메인 위임**: `memory/`

```
→ memory/workflows/check-knowledge.md
  입력:
    - 카테고리: conventions
    - 키워드: [document-style, writing-guidelines]
  출력:
    - 문서 작성 규칙
    - 스타일 가이드
```

---

## 5. 문서 작성/수정

**로컬 실행**:
1. 템플릿 기반으로 문서 작성
2. 작성 규칙 준수 확인
3. 파편화 원칙 적용 (짧고 집중적으로)
4. Navigation Map 포함 (필요시)

---

## 6. 관련 문서 동기화 확인

**참조**: `routing/sync-rules.md` (예정)

**체크리스트**:
- [ ] 이 문서와 연결된 다른 문서가 있는가?
- [ ] 라우팅 맵 업데이트가 필요한가?
- [ ] overview 문서 업데이트가 필요한가?

**필요시 도메인 위임**:
```
→ memory/workflows/update-knowledge.md
→ routing/ 문서들 수정
```

---

## 7. Task 완료

**도메인 위임**: `tasks/`

```
→ tasks/workflows/complete-task.md
  입력:
    - Task ID
    - 변경 파일 목록
    - 완료 요약
  출력:
    - current-state.md 업데이트됨
    - 사용자에게 요약 제공
```

---

## 예시 실행

**입력**: "workflows/에 새로운 워크플로우 추가"

```
1. tasks/workflows/create-task.md
   → Task 생성됨

2. 문서 타입: workflow

3. templates/workflows/get-template.md
   → workflow-template.md 로드

4. memory/workflows/check-knowledge.md
   → conventions/document-style.md 확인

5. 새 워크플로우 작성
   - 템플릿 사용
   - 파편화 원칙 적용
   - 오케스트레이션 구조 준수

6. 동기화 확인
   - routing/main-routing-map.md 업데이트 필요
   - workflows/workflows-overview.md 업데이트

7. tasks/workflows/complete-task.md
   → 완료 처리
```

---

## 주의사항

- 파편화 원칙: 문서는 짧고 집중적으로
- 라우팅 맵: 새 문서 추가 시 반드시 라우팅 맵 갱신
- 동기화: 관련 문서들과의 일관성 유지
- Task 추적: 시작과 끝에 반드시 tasks 도메인 위임

---

## Meta-recursive 특성

이 워크플로우는 **자기 참조적**입니다:
- LTM 시스템의 문서를 관리
- LTM 시스템을 사용하여 관리
- 이 문서 자체도 이 워크플로우로 만들어짐! 🔄
