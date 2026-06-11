# Memory Manager Agent 명세

> `kor/`의 유일한 쓰기 주체. Worker들의 LearningPayload를 수집·검증·통합한다.

## 역할

1. 모든 Worker Agent의 LearningPayload를 수집
2. 기존 `kor/memory/`와 충돌 검사
3. 비충돌 지식을 `kor/memory/`에 Binding
4. 충돌·모호한 항목을 사용자에게 에스컬레이션
5. BindingResult 반환

---

## 입력: LearningPayload 목록

```
입력: List<LearningPayload>
  - Worker Contract 형식 준수 (worker-contract.md 참조)
  - outcome: failed인 payload는 learned 항목 무시
  - confidence: low 항목은 사용자 확인 단계로 분리
```

---

## 처리 절차

### Phase 1: 수집 및 필터링

```
FOR EACH payload IN inputs:
  IF payload.outcome == failed:
    SKIP learned items (possible_conflicts는 참고로 보존)
  ELSE:
    QUEUE all learned.new_knowledge
    QUEUE all learned.corrections
    QUEUE all learned.obsolete
    NOTE all possible_conflicts
```

### Phase 2: 충돌 검사

```
FOR EACH new_knowledge item:
  suggested_path가 이미 존재하는가?
    → YES: 기존 내용과 의미적 충돌 여부 확인
      - 충돌 없음 → MERGE (기존 파일에 섹션 추가)
      - 충돌 있음 → ESCALATE
    → NO: CREATE (새 파일 생성)

FOR EACH correction item:
  target path가 존재하는가?
    → YES: 변경 내용이 기존 내용과 모순인가?
      - 명확한 업데이트 → UPDATE
      - 다른 correction과 충돌 → ESCALATE
    → NO: 경고 기록 (path가 잘못된 것일 수 있음)

FOR EACH obsolete item:
  실제로 해당 파일이 obsolete인가?
    - confidence high → DELETE (또는 archive)
    - confidence medium/low → ESCALATE
```

### Phase 3: Binding 실행

```
비충돌 항목 순서:
1. 새 파일 생성 (new_knowledge, path 없음)
2. 기존 파일 업데이트 (corrections, merges)
3. 파일 삭제 (obsolete, confidence high만)

각 변경 후 lint-refs.sh 통과 확인
```

### Phase 4: 에스컬레이션

```
사용자에게 제시할 항목:
- 의미적 충돌 (두 Worker가 서로 다른 내용을 주장)
- 구조적 충돌 (같은 경로에 다른 내용)
- confidence low 항목 (확인 필요)
- possible_conflicts 중 실제 확인된 것

제시 형식:
  "[충돌 내용]
   옵션 A: [Worker A 주장]
   옵션 B: [Worker B 주장]
   사용자 판단 필요"
```

---

## 출력: BindingResult

```yaml
bound:
  created:
    - path: string
      title: string
      source_task: string   # 어느 task_id에서 왔는지

  updated:
    - path: string
      summary: string       # 무엇이 바뀌었는지 한 줄
      source_task: string

  deleted:
    - path: string
      reason: string

escalations:
  - type: conflict | ambiguous | low_confidence
    description: string
    resolution_options: [string]   # 사용자가 고를 수 있는 선택지
    raw_payloads: [task_id]        # 어느 payload에서 나왔는지

skipped:
  - task_id: string
    reason: string   # outcome:failed 또는 기타

summary: string      # 전체 Binding 결과 한 줄 요약
```

---

## 에러 처리

| 상황 | 대응 |
|------|------|
| `suggested_path`가 `kor/memory/` 밖 | REJECT + 에스컬레이션 |
| lint-refs 실패 | 해당 파일 변경 롤백 + 에스컬레이션 |
| 모든 payload가 failed | BindingResult에 skipped만 채워 반환 |
| 에스컬레이션 항목 > 5개 | 우선순위 상위 5개만 처리, 나머지는 다음 세션으로 |

---

## 제약 조건

- `kor/memory/` 외부 파일은 수정하지 않는다
- `kor/tasks/current-state.md` 업데이트는 Orchestrator 책임
- 한 번의 Memory Manager 실행에서 처리하지 못한 항목은 사라지지 않고 에스컬레이션

---

## 관련 문서

- `worker-contract.md` — 입력 형식(LearningPayload)
- `../memory/entry.md` — Binding 대상 메모리 도메인
- `../workflows/agent-parallel.md` — 전체 실행 흐름에서 이 Agent의 위치
