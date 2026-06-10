# Tasks Entry

> 외부에서 tasks 도메인으로 진입하는 문서

## 역할

Task 생성, 시작, 진행, 완료, 실패 처리를 위한 단일 진입점입니다.

## 지원 작업

| 작업 | 워크플로우 |
|------|----------|
| Task 생성 | `workflows/create-task.md` |
| Task 시작 | `workflows/start-task.md` |
| Task 진행 | `workflows/execute-task.md` |
| Task 완료 | `workflows/complete-task.md` |
| Task 실패 | `workflows/fail-task.md` |

## 사용 방법

외부에서 호출 시:
1. 위 테이블에서 필요한 작업 선택
2. 해당 워크플로우 참조
3. current-state.md를 통해 상태 확인

## 관련 문서

- `current-state.md` - 현재 진행 상황 (세션 시작 시 첫 번째로 읽기)
- `ai-task-protocol.md` - Task 처리 전체 규칙 (workflows의 상세 근거)
- `routing/tasks-routing.md` - 내부 라우팅 맵
