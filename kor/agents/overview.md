# 에이전트 시스템 개요

> Phase 4에서 도입. 단일 LLM → 역할별 에이전트 협업 구조로 진화.

## 왜 에이전트 구조인가

단일 LLM이 복잡한 작업을 처리할 때 Context Window 한계에 빠르게 도달한다.
에이전트 구조는 작업을 분리해 각 에이전트가 좁은 컨텍스트에서 집중하게 한다.

## 핵심 설계 결정

**단일 쓰기 주체(Single Writer)**:
- `kor/` 쓰기는 Memory Manager Agent만 수행
- Worker Agent는 읽기만 하고, 작업 결과를 구조화된 출력으로 반환
- Race condition 구조적 제거

**인지 모델 대응**:
- 병렬 Worker 실행 = 여러 작업기억(Context Window)이 동시에 처리
- Memory Manager의 Binding = 새 지식을 기존 LTM과 연결해 통합

## 에이전트 역할

```
Orchestrator Agent
├── 작업 분석 및 Worker 할당
├── Worker Agent (병렬, N개)
│   ├── kor/ 읽기 전용 접근
│   └── LearningPayload 반환 (kor/ 직접 쓰기 없음)
└── Memory Manager Agent (마지막에 단독 실행)
    ├── LearningPayload 수집 및 검증
    ├── 기존 kor/memory/와 충돌 검사
    ├── 비충돌 지식 Binding
    └── 충돌 시 사용자(Central Executive)에게 에스컬레이션
```

## 문서 구조

| 문서 | 내용 |
|------|------|
| `overview.md` | 이 문서. 전체 구조 |
| `memory-manager.md` | Memory Manager Agent 명세 |
| `worker-contract.md` | Worker Agent가 반환해야 할 LearningPayload 형식 |

## 관련 문서

- `../workflows/agent-parallel.md` — 병렬 작업 + Binding 전체 워크플로우
- `../memory/entry.md` — Memory Manager가 사용하는 메모리 도메인 진입점
