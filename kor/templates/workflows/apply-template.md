# Apply Template

> 템플릿으로 새 문서 생성

## 입력

- `type`: 템플릿 타입
- `target_path`: 생성할 파일 경로
- `content`: 채울 내용

## 실행

1. `get-template.md` 호출
   - get-template이 `templates-routing.md` 참조하여 파일 위치 반환
2. `{}` 항목을 `content`로 채우기
3. `target_path`에 파일 생성

## 출력

- 생성된 파일 경로
