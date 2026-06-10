# LTM 시스템 개요

> 이 문서를 가장 먼저 읽으세요. 시스템 전체 구조를 설명합니다.

## 이 시스템이란

LTM(Long-Term Memory) for LLM은 LLM이 프로젝트 작업을 이어서 할 수 있도록
지식과 작업 상태를 마크다운 파일로 저장하는 시스템입니다.

## 핵심 구조

```
kor/
├── meta/           ← 지금 여기. 시스템 이해의 출발점
├── routing/        ← 상황별 어떤 문서를 읽을지 결정
├── workflows/      ← 작업을 어떻게 수행할지 정의
├── memory/         ← 실제 지식 저장
├── tasks/          ← 작업 상태 관리
└── templates/      ← 새 문서 작성용 양식
```

## 작동 원리

**명시적 라우팅**: LLM이 스스로 탐색하지 않습니다. 라우팅 문서가 "다음에는 이 파일을 읽어라"고 지시합니다.

**선택적 로드**: 전체 문서를 읽지 않습니다. 작업에 필요한 문서만 라우팅에 따라 읽습니다.

**도메인 위임**: 각 도메인(tasks, memory, templates)은 독립적입니다. 상위 워크플로우가 각 도메인에 작업을 위임합니다.

## 세션 시작 흐름

```
1. meta/system-overview.md       ← 지금 읽는 이 문서
2. tasks/current-state.md        ← 진행 중인 작업 확인
   ├── 진행 중 Task 있음 → 해당 Task 이어서 진행
   └── 없음 → 3번으로
3. routing/main-routing-map.md   ← 사용자 요청에 맞는 워크플로우 선택
4. workflows/{상황}.md           ← 워크플로우 따라 단계 수행
5. 각 도메인 entry.md            ← 필요한 도메인에 위임
```

## 빠른 참조

| 목적 | 읽을 문서 |
|------|---------|
| 상황에 맞는 워크플로우 찾기 | `routing/main-routing-map.md` |
| 새 문서 작성 방법 | `templates/entry.md` |
| 작업 상태 확인 | `tasks/current-state.md` |
| 지식 추가/조회 | `memory/entry.md` |

## 다음 단계

→ `routing/main-routing-map.md`에서 현재 상황에 맞는 워크플로우를 선택하세요.
