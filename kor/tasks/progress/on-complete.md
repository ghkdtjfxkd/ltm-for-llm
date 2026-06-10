# Task 완료 시

> Task 완료 시 수행해야 할 절차

## 1. 완료 체크리스트

- [ ] Task 목표 달성 확인
- [ ] 관련 문서 업데이트 필요 여부 확인 (연결된 routing 맵, entry.md 등)
- [ ] 테스트/검증 수행
- [ ] 부작용 없는지 확인

## 2. 지식 통합 (Binding)

이 세션에서 새로 알게 된 것을 LTM에 추가합니다.

```
다음 질문에 답하고, 해당하는 것이 있으면 memory에 추가:

- 이 작업을 통해 새로 파악한 구조나 설계가 있는가?
  → memory/architecture/

- 새로 정한 규칙이나 컨벤션이 있는가?
  → memory/conventions/

- 재사용할 만한 패턴이나 해결책이 있는가?
  → memory/patterns/

- 겪은 문제와 해결 방법이 있는가?
  → memory/troubleshooting/
```

해당하는 것이 없으면 이 단계는 건너뜁니다.

추가 절차: `memory/entry.md` → `workflows/add-knowledge.md`

## 3. current-state.md 업데이트

진행 중인 작업 섹션에서 해당 Task 제거 후 완료된 작업에 추가:

```markdown
## 완료된 작업
- [x] **Task 제목**
  - 완료 일시: YYYY-MM-DD
  - 주요 변경사항: ...
  - 관련 파일: ...
```

## 4. 사람에게 요약 제공

```
완료한 작업:
- 무엇을 했는지
- 어떤 파일이 변경되었는지
- LTM에 추가한 지식 (있다면)
- 확인해야 할 사항 (있다면)
```

## 추가 참고

- 문서 동기화: `doc-update.md` 참조
