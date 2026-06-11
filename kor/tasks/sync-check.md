# Tasks Sync Check

> tasks 도메인에서 변경 발생 시 영향받는 문서 점검 목록

---

## 새 워크플로우 추가 시

- [ ] `routing/tasks-routing.md` - 워크플로우 경로 추가
- [ ] `workflows/overview.md` - 워크플로우 목록 업데이트
- [ ] `entry.md` - 지원 작업 테이블 추가
- [ ] `overview.md` - 파일 목록 업데이트
- [ ] **이 문서** - 새 시나리오 추가 필요한지 확인

---

## progress/ 파일 추가/수정 시

- [ ] `overview.md` - 파일 목록 업데이트
- [ ] `ai-task-protocol.md` - 연관 규칙 반영 여부 확인
- [ ] 참조 워크플로우(`execute-task.md` 등) - progress 링크 유효한지 확인
- [ ] **이 문서** - 체크 항목 업데이트 필요한지 확인

---

## current-state.md 구조 변경 시

- [ ] `entry.md` - 사용 방법 설명 업데이트
- [ ] `meta/system-overview.md` - 세션 시작 흐름 설명 반영
- [ ] `CLAUDE.md` (루트) - 빠른 참조 테이블 반영
- [ ] **이 문서** - 체크 항목 업데이트 필요한지 확인

---

## entry.md 수정 시

- [ ] 연결된 `workflows/` 파일 실제 존재 여부 확인
- [ ] `routing/tasks-routing.md` - 라우팅 경로 일치 여부
- [ ] **이 문서** - 체크 항목 업데이트 필요한지 확인

---

## routing 수정 시

- [ ] 연결된 워크플로우/파일 실제 존재 여부 확인
- [ ] `entry.md` - 지원 작업 테이블과 일관성 확인
- [ ] **이 문서** - 체크 항목 업데이트 필요한지 확인

---

## 이 문서(sync-check.md) 자체 수정 시

- [ ] 누락된 시나리오 없는지 전체 검토
- [ ] 각 체크 항목이 실제 존재하는 파일인지 확인
- [ ] `entry.md`, `overview.md`와 일관성 확인
