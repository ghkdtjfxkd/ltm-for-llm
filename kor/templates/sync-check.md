# Templates Sync Check

> templates 도메인에서 변경 발생 시 영향받는 문서 점검 목록

---

## 새 템플릿 추가 시

- [ ] `templates-routing.md` - 타입/파일 위치 추가
- [ ] `overview.md` - 템플릿 목록 업데이트
- [ ] `entry.md` - 새 작업 유형이면 워크플로우 목록 추가
- [ ] **이 문서** - 새 시나리오 추가 필요한지 확인

---

## 워크플로우 추가/수정 시

- [ ] `entry.md` - 워크플로우 목록 업데이트
- [ ] **이 문서** - 새 체크 항목 필요한지 확인

---

## entry.md 수정 시

- [ ] 연결된 `workflows/` 파일 실제 존재 여부 확인
- [ ] **이 문서** - 체크 항목 업데이트 필요한지 확인

---

## routing 수정 시

- [ ] 연결된 워크플로우/파일 실제 존재 여부 확인
- [ ] `workflows/get-template.md` - templates-routing.md 참조 정상 여부
- [ ] **이 문서** - 체크 항목 업데이트 필요한지 확인

---

## 이 문서(sync-check.md) 자체 수정 시

- [ ] 누락된 시나리오 없는지 전체 검토
- [ ] 각 체크 항목이 실제 존재하는 파일인지 확인
- [ ] entry.md, overview.md와 일관성 확인
