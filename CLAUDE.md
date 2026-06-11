# LTM for LLM — Claude Code 진입점

이 저장소는 LLM이 프로젝트 작업 시 장기기억을 유지하도록 설계된
마크다운 기반 메모리 하네스입니다.

## 세션 시작 시 필수 절차

새 세션을 시작할 때 **반드시 아래 순서대로** 읽으세요.

### 1단계 — 시스템 이해

```
→ kor/meta/system-overview.md
```

시스템 전체 구조, 작동 원리, 세션 흐름을 설명합니다.
이 문서를 읽지 않으면 나머지 문서를 올바르게 해석할 수 없습니다.

### 2단계 — 진행 중인 작업 확인

```
→ kor/tasks/current-state.md
```

- **진행 중 Task 있음** → 해당 Task 이어서 진행
- **없음** → `kor/routing/main-routing-map.md`에서 적절한 워크플로우 선택

## 핵심 규칙

- 전체 문서를 읽지 않습니다. 라우팅이 지시한 문서만 읽습니다.
- `kor/` 안의 문서를 수정할 때는 `lint-refs.sh`가 자동 실행됩니다.
  깨진 참조가 있으면 즉시 수정하세요.
- 개인 작업 추적은 `personal/`에, 공개 템플릿과 시스템 문서는 `kor/`에만 작성합니다.

## 빠른 참조

| 목적 | 파일 |
|------|------|
| 시스템 구조 파악 | `kor/meta/system-overview.md` |
| 진행 중 작업 확인 | `kor/tasks/current-state.md` |
| 워크플로우 선택 | `kor/routing/main-routing-map.md` |
| 새 문서 작성 | `kor/templates/entry.md` |
| 지식 추가/조회 | `kor/memory/entry.md` |
