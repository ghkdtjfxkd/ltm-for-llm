# 명시적 라우팅 패턴

> patterns: LLM이 어느 문서를 읽을지 명시적으로 지정하는 패턴

## 내용

LLM은 어떤 문서를 읽어야 할지 스스로 추론하지 않습니다.
라우팅 문서가 "다음에는 X를 읽어라"고 명시적으로 지시합니다.

### 구조

```
상황 발생
    ↓
routing 문서 읽기
    ↓
"→ workflows/xxx.md 참조" (명시적 지시)
    ↓
해당 워크플로우 읽기
    ↓
"→ memory/yyy.md 참조" (필요시)
    ↓
작업 수행
```

### 예시

```markdown
## 지식 추가
**상황**: 새로운 지식을 memory에 추가
**워크플로우**: `workflows/add-knowledge.md`
```

LLM은 "지식 추가"가 필요하면 라우팅 맵에서 위 항목을 찾고,
`workflows/add-knowledge.md`를 읽습니다. 추론 없이 따라갑니다.

## 언제 사용

- 새 도메인의 라우팅 맵 작성 시
- 워크플로우 단계에서 다음 문서 지시 시
- 복잡한 분기 로직을 라우팅으로 표현할 때

## 관련 문서

- `kor/routing/main-routing-map.md` - 실제 적용 예시
- `kor/memory/routing/memory-routing.md` - 도메인 내부 라우팅 예시
