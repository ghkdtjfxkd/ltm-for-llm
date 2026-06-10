# 한국어 문서

LTM for LLM 프로젝트의 한국어 문서입니다.

## 디렉토리 구조

```
kor/
├── meta/               # 시스템 전체 가이드 (세션 시작점)
├── routing/            # 문서 찾기 가이드
├── workflows/          # 작업 방식 정의
├── tasks/              # 작업 상태 관리
├── memory/             # 지식 저장소
│   ├── architecture/
│   ├── conventions/
│   ├── patterns/
│   ├── troubleshooting/
│   └── domain-knowledge/
└── templates/          # 문서 작성 템플릿
```

## 각 폴더 역할

- **meta**: 전체 시스템 사용법과 개요
- **routing**: 상황별로 어떤 문서를 읽을지 안내
- **workflows**: 작업을 어떤 순서로 진행할지 정의
- **tasks**: 작업 상태 관리, 현재 진행 중인 작업 추적
- **memory**: 실제 지식과 정보 저장
- **templates**: 새 문서 작성할 때 사용할 양식

## 시작하기

1. `meta/system-overview.md` 읽기
2. `tasks/current-state.md` 로 진행 중인 작업 확인
3. `routing/main-routing-map.md` 에서 상황에 맞는 워크플로우 선택
4. `workflows/` 에서 작업 단계 수행
5. 구체적 정보는 `memory/`에서 찾기
