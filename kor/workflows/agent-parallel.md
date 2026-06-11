# 병렬 에이전트 작업 + Binding 워크플로우

> 복잡한 작업을 Worker Agent들이 병렬로 처리하고,
> Memory Manager Agent가 결과를 kor/에 통합하는 전체 흐름.

## 언제 사용하는가

- 독립적으로 분리 가능한 서브태스크가 2개 이상
- 각 서브태스크가 서로 다른 메모리 도메인을 다루는 경우
- 단일 Context Window로는 전체를 처리하기 어려운 규모

단일 서브태스크 작업은 기존 워크플로우(`feature-development.md` 등) 사용.

---

## 전체 흐름

```
Phase 1: 준비
  ↓ Orchestrator가 kor/ 분석, 서브태스크 분리
Phase 2: 병렬 실행
  ↓ Worker Agents가 각자 서브태스크 수행 (kor/ 읽기만)
Phase 3: 수집
  ↓ Orchestrator가 LearningPayload 모두 수집
Phase 4: Binding
  ↓ Memory Manager Agent가 kor/memory/ 업데이트
Phase 5: 완료
  ↓ current-state.md 업데이트, 사용자 보고
```

---

## Phase 1: 준비 (Orchestrator)

### 1-1. Task 생성

```
→ tasks/entry.md → workflows/create-task.md
  입력:
    - Task 제목
    - 서브태스크 목록
  출력:
    - current-state.md에 Task 기록
```

### 1-2. 서브태스크 분리 기준

서브태스크는 아래 조건을 모두 만족해야 한다:

```
✅ 독립성: 다른 서브태스크의 완료 결과에 의존하지 않음
✅ 경계 명확: "어디까지가 이 Worker의 범위인지" 한 문장으로 설명 가능
✅ LTM 쓰기 없음: Worker는 kor/에 직접 쓰지 않음
```

의존성이 있으면 → 직렬로 처리 (순서 명시)

### 1-3. Worker별 컨텍스트 준비

각 Worker에게 전달할 정보:
```
- 서브태스크 설명 (범위, 목표)
- 읽어야 할 kor/ 파일 목록 (Orchestrator가 pre-select)
- LearningPayload 형식 안내 (worker-contract.md 요약)
- 금지 사항: kor/ 파일 직접 수정
```

---

## Phase 2: 병렬 실행 (Worker Agents)

### Worker의 책임

```
1. 지정된 kor/ 파일만 읽음 (범위 밖 파일은 필요시 Orchestrator에 요청)
2. 서브태스크 수행
3. LearningPayload 형식으로 결과 반환 (worker-contract.md 준수)
4. kor/ 직접 수정 금지
```

### 병렬 실행 규칙

- 읽기는 경합 없음 → 모든 Worker가 같은 파일을 동시에 읽어도 무방
- 쓰기는 Memory Manager만 → Worker 완료 후 Phase 4에서 처리
- Worker 실패 시: `outcome: failed`로 payload 반환, 나머지는 계속 진행

---

## Phase 3: 수집 (Orchestrator)

```
1. 모든 Worker Agent 완료 대기
2. LearningPayload 목록 수집
3. 간단한 유효성 검사:
   - 각 payload에 task_id, outcome 존재하는지
   - worker-contract.md 형식 준수하는지
4. Memory Manager Agent 호출 준비
```

---

## Phase 4: Binding (Memory Manager Agent)

```
→ agents/memory-manager.md 참조

입력: List<LearningPayload>
처리:
  - 충돌 검사
  - 비충돌 항목 kor/memory/ 에 통합
  - 충돌 항목 에스컬레이션

출력: BindingResult
  - bound.created / bound.updated / bound.deleted
  - escalations (충돌 목록)
  - summary
```

### 에스컬레이션 처리

```
escalations가 있으면:
  → 사용자에게 각 충돌 제시
  → 사용자 결정 후 Memory Manager가 해당 항목 재처리

escalations가 없으면:
  → Phase 5로 진행
```

---

## Phase 5: 완료 (Orchestrator)

### 5-1. current-state.md 업데이트

```
→ tasks/entry.md → workflows/complete-task.md
  입력:
    - Task 제목
    - Binding 결과 요약 (BindingResult.summary)
    - 변경된 kor/ 파일 목록 (BindingResult.bound)
```

### 5-2. 사용자 보고

```
보고 형식:
  완료한 서브태스크: [목록]
  LTM에 추가된 지식:
    - [BindingResult.bound.created 목록]
  업데이트된 지식:
    - [BindingResult.bound.updated 목록]
  확인 필요 사항:
    - [BindingResult.escalations 목록] (없으면 생략)
```

---

## 흐름 요약 다이어그램

```
Orchestrator
    │
    ├─── Task 생성 → tasks/
    │
    ├─── Worker A ──┐
    ├─── Worker B ──┤ (병렬)
    └─── Worker C ──┘
                    │
                    ▼ LearningPayload × 3
    Orchestrator (수집)
                    │
                    ▼
    Memory Manager Agent
        ├── Binding → kor/memory/ 업데이트
        └── Escalation → 사용자 결정
                    │
                    ▼
    Orchestrator
        ├── current-state.md 업데이트
        └── 사용자 보고
```

---

## 주의사항

- Worker는 **절대 kor/을 직접 수정하지 않는다** (시스템 불변식)
- Orchestrator는 서브태스크 경계를 명확히 해야 한다 (모호하면 Worker가 범위를 넘침)
- Memory Manager는 마지막에 **한 번만** 실행 (중간에 호출하지 않음)

---

## 관련 문서

- `agents/memory-manager.md` — Memory Manager 상세 명세
- `agents/worker-contract.md` — LearningPayload 형식
- `agents/overview.md` — 에이전트 시스템 전체 구조
