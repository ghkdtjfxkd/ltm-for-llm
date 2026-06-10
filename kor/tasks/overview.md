# Tasks - 작업 관리

## 이 폴더의 역할

프로젝트의 작업(task)을 관리하고 추적합니다.

사람이 진행 상황을 파악하고, AI가 작업을 체계적으로 수행하도록 돕습니다.

## 파일 목록

| 파일/폴더 | 내용 |
|----------|------|
| `current-state.md` | 현재 진행 중인 작업 상태 (세션 재시작 시 첫 번째로 읽기) |
| `entry.md` | 외부 진입점: Task 작업별 워크플로우 안내 |
| `ai-task-protocol.md` | AI용 Task 처리 전체 규칙 |
| `tasks-mutexs.md` | 동시 실행 불가 Task 규칙 |
| `routing/tasks-routing.md` | Tasks 도메인 내부 라우팅 맵 |
| `workflows/overview.md` | workflows 폴더 설명 및 파일 목록 |
| `workflows/create-task.md` | Task 생성 |
| `workflows/start-task.md` | Task 시작 전 체크리스트 |
| `workflows/execute-task.md` | Task 진행 중 가이드라인 |
| `workflows/complete-task.md` | Task 완료 처리 |
| `workflows/fail-task.md` | Task 실패 시 롤백 |
| `progress/before-start.md` | 시작 전 상세 체크리스트 |
| `progress/in-progress.md` | 진행 중 규칙 |
| `progress/on-complete.md` | 완료 절차 및 Binding |
| `progress/on-failure.md` | 실패 시 롤백 절차 |
| `progress/doc-update.md` | 문서 동기화 규칙 |
| `progress/task-splitting.md` | Task 분리 기준 |
| `progress/special-cases.md` | 특수 상황 처리 |

## 핵심 원칙

- **작은 단위**: Task는 명확하고 작게
- **문서화**: 진행 상황을 항상 기록
- **롤백 가능**: 실패하면 되돌릴 수 있게
- **연속성**: 세션이 바뀌어도 이어서 할 수 있게
