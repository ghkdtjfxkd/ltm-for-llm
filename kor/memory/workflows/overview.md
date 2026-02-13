# Memory Workflows

> Memory 도메인의 내부 워크플로우들

## 역할

최상위 workflows에서 위임받은 memory 관련 작업을 수행합니다.

## 포함된 워크플로우

### `add-knowledge.md` (예정)
새로운 지식을 적절한 카테고리에 추가하는 절차

### `update-knowledge.md` (예정)
기존 지식 문서를 업데이트하는 절차

### `check-knowledge.md` (예정)
특정 지식이 존재하는지 확인하고 로드하는 절차

---

## 사용 예시

최상위 `workflows/feature-development.md`에서:

```markdown
## 2. 아키텍처 확인

memory 도메인에 위임:
→ memory/workflows/check-knowledge.md
  - 카테고리: architecture
  - 키워드: [시스템 구조, 모듈 관계]
```

---

## 특징

- **독립적 실행**: 최상위에서 위임받아 독립적으로 수행
- **결과 반환**: 로드한 지식이나 처리 결과를 반환
- **내부 라우팅**: `routing/memory-routing.md` 참조
