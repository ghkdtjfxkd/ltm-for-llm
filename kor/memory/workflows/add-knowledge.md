# 지식 추가

> memory 도메인 워크플로우: 새 지식을 적절한 카테고리에 추가

## 입력

- 지식 제목
- 지식 내용
- 카테고리 (architecture / conventions / patterns / troubleshooting / domain-knowledge)

## 절차

### 1. 카테고리 결정

```
시스템 구조, 설계 → architecture/
코딩 규칙, 네이밍 → conventions/
재사용 패턴, 솔루션 → patterns/
에러, 문제 해결 → troubleshooting/
도메인 용어, 비즈니스 로직 → domain-knowledge/
```

### 2. 기존 문서 확인

해당 카테고리 `overview.md`의 **파일 목록** 테이블 확인.

동일하거나 유사한 문서가 있으면 → `update-knowledge.md` 사용.

### 3. 새 문서 작성

`templates/memory-node-template.md` 사용:

```markdown
# {지식 제목}

> {카테고리}: {한 줄 요약}

## 내용

{핵심 지식}

## 언제 사용

- {상황 1}
- {상황 2}

## 관련 문서

- `{관련 파일 경로}`
```

### 4. 파일 저장

경로: `memory/{카테고리}/{파일명}.md`

파일명은 내용을 설명하는 kebab-case.

### 5. 카테고리 overview.md 파일 목록 업데이트

해당 카테고리 `overview.md`의 **파일 목록** 테이블에 새 파일 추가:

```markdown
| `{파일명}.md` | {한 줄 설명} |
```

### 6. 출력

- 새 지식 문서 생성됨
- 카테고리 overview.md 파일 목록 업데이트됨
