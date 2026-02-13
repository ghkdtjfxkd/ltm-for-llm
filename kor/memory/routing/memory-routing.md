# Memory 도메인 라우팅

> Memory 도메인 내부의 라우팅 맵

## 기본 원칙

이 라우팅 맵은 **memory 도메인 내부**에서만 사용됩니다.
최상위 workflows에서 위임받은 작업을 수행할 때 참조합니다.

---

## 상황별 라우팅

### 지식 추가

**상황**: 새로운 지식을 memory에 추가
**워크플로우**: `workflows/add-knowledge.md`

### 지식 조회

**상황**: 기존 지식 찾기
**라우팅**:
- 아키텍처 관련 → `architecture/`
- 규칙/관례 → `conventions/`
- 패턴/솔루션 → `patterns/`
- 문제 해결 → `troubleshooting/`
- 도메인 지식 → `domain-knowledge/`

### 지식 업데이트

**상황**: 기존 지식 수정
**워크플로우**: `workflows/update-knowledge.md`

---

## 빠른 참조

| 작업 | 워크플로우 |
|------|-----------|
| 지식 추가 | `workflows/add-knowledge.md` |
| 지식 조회 | 해당 카테고리 직접 참조 |
| 지식 업데이트 | `workflows/update-knowledge.md` |
