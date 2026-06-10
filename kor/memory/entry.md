# Memory Entry

> 외부에서 memory 도메인으로 진입하는 문서

## 역할

지식 추가, 조회, 업데이트를 위한 단일 진입점입니다.

## 지원 작업

| 작업 | 워크플로우 |
|------|----------|
| 지식 추가 | `workflows/add-knowledge.md` |
| 지식 조회 | `workflows/get-knowledge.md` |
| 지식 업데이트 | `workflows/update-knowledge.md` |

## 사용 방법

외부에서 호출 시:
1. 위 테이블에서 필요한 작업 선택
2. 해당 워크플로우 참조
3. 워크플로우가 적절한 카테고리로 안내

## 카테고리

| 카테고리 | 내용 |
|---------|------|
| `architecture/` | 시스템 구조, 설계 결정 |
| `conventions/` | 코딩 스타일, 네이밍 규칙 |
| `patterns/` | 자주 쓰는 패턴, 해결책 |
| `troubleshooting/` | 문제 해결 방법 |
| `domain-knowledge/` | 도메인 전문 지식 |

## 관련 문서

- `routing/memory-routing.md` - 내부 라우팅 맵
- `../templates/memory-node-template.md` - 지식 문서 템플릿
