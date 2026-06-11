# Agents Entry

> 외부에서 agents 도메인으로 진입하는 문서

## 역할

병렬 에이전트 시스템의 명세를 제공하는 단일 진입점입니다.
Worker Agent 계약, Memory Manager 동작 방식, 전체 구조를 안내합니다.

## 목적별 문서

| 목적 | 문서 |
|------|------|
| 전체 구조 파악 | `overview.md` |
| Worker가 반환할 출력 형식 | `worker-contract.md` |
| Memory Manager 동작 방식 | `memory-manager.md` |
| 전체 실행 흐름 (워크플로우) | `../workflows/agent-parallel.md` |

## 사용 방법

**Orchestrator가 병렬 작업을 시작할 때:**
→ `overview.md` → `../workflows/agent-parallel.md`

**Worker Agent가 출력 형식을 확인할 때:**
→ `worker-contract.md`

**Memory Manager 로직을 구현/수정할 때:**
→ `memory-manager.md`

## 관련 문서

- `../memory/entry.md` — Memory Manager가 Binding 시 사용하는 저장소
- `../routing/main-routing-map.md` — 병렬 에이전트 작업 진입점
