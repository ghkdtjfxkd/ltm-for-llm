# Worker Agent 계약 (LearningPayload)

> Worker Agent가 작업 완료 후 반드시 반환해야 하는 출력 형식.
> 이 계약을 지키지 않으면 Memory Manager가 지식을 통합할 수 없다.

## 기본 원칙

- Worker는 `kor/` 파일을 **직접 수정하지 않는다**
- 작업 중 알게 된 모든 것은 이 형식으로 반환한다
- 불확실한 내용은 `confidence: low`로 표시한다

## LearningPayload 형식

```yaml
task_id: string           # 어떤 Task에서 나온 것인지 (예: "auth-module-refactor")
agent_role: string        # 이 Worker의 역할 (예: "코드 분석", "API 설계")
outcome: success | partial | failed

learned:
  new_knowledge:          # 새로 알게 된 것들
    - domain: architecture | patterns | conventions | troubleshooting | domain-knowledge
      title: string       # 한 줄 제목
      content: string     # 상세 내용 (마크다운)
      suggested_path: string  # 저장 권장 경로 (예: kor/memory/patterns/auth-token-pattern.md)
      confidence: high | medium | low

  corrections:            # 기존 LTM 내용 중 수정이 필요한 것
    - path: string        # 수정 대상 파일 경로 (예: kor/memory/architecture/overview.md)
      what: string        # 무엇이 바뀌었는지
      why: string         # 왜 바뀌었는지 (근거)
      confidence: high | medium | low

  obsolete:               # 더 이상 유효하지 않은 문서
    - path: string        # 삭제/보관 대상 경로
      reason: string      # 왜 obsolete인지

possible_conflicts:       # 작업 중 발견한 잠재적 충돌 (사전 경고)
  - description: string
    type: factual | structural | naming
    affected_paths: [string]
```

## 작성 규칙

### learned.new_knowledge

- `content`는 미래의 LLM이 읽을 마크다운. 충분히 자기완결적으로 작성
- `suggested_path`는 필수. Memory Manager가 배치 결정에 참고
- `confidence: low`는 Memory Manager가 사용자 확인을 거치게 한다

### learned.corrections

- 기존 파일이 **틀렸음을** 발견한 경우만 사용
- 단순 추가는 `new_knowledge`에 넣는다
- `why`에 근거(코드, 테스트, 문서)를 명시

### possible_conflicts

- 확실한 충돌이 아니어도 의심되면 기재
- Memory Manager가 실제 충돌 여부를 검증

## 예시

```yaml
task_id: "api-rate-limit-implementation"
agent_role: "API 설계 및 구현"
outcome: success

learned:
  new_knowledge:
    - domain: patterns
      title: "Rate Limiting - Token Bucket 패턴"
      content: |
        ## Token Bucket Rate Limiting

        Redis를 이용한 토큰 버킷 구현. 버킷 크기 = 100req/min.
        키 형식: `rate_limit:{user_id}:{minute_bucket}`
        
        주의: 분 경계에서 burst 허용. 엄격한 제한이 필요하면 sliding window 사용.
      suggested_path: "kor/memory/patterns/rate-limit-token-bucket.md"
      confidence: high

  corrections:
    - path: "kor/memory/architecture/api-layer.md"
      what: "Rate limiting이 middleware가 아닌 gateway에서 처리됨"
      why: "구현 결과 gateway가 먼저 요청을 받아 처리하는 구조로 확정"
      confidence: high

possible_conflicts: []
```

## 관련 문서

- `memory-manager.md` — 이 payload를 처리하는 Memory Manager 명세
- `../workflows/agent-parallel.md` — 전체 실행 흐름
