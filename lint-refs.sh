#!/usr/bin/env bash
# kor/ 마크다운 파일의 → 경로 참조가 실제로 존재하는지 검사
#
# 해석 우선순위:
#   1. kor/ 루트 기준  (tasks/entry.md  → kor/tasks/entry.md)
#   2. 파일 디렉토리 기준  (progress/x.md → 같은 레벨)
#   3. 파일의 부모 디렉토리 기준  (tasks/workflows/의 progress/x.md → tasks/progress/x.md)
# 코드 펜스(```) 내부 및 플레이스홀더({...} 포함) 참조는 건너뜀

set -uo pipefail

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
KOR_DIR="$REPO_ROOT/kor"
ERRORS=0

normalize() {
  python3 -c "import os; print(os.path.normpath(os.path.join('$1', '$2')))" 2>/dev/null || echo ""
}

while IFS= read -r -d '' md_file; do
  file_dir="$(dirname "$md_file")"
  parent_dir="$(dirname "$file_dir")"
  in_fence=0

  while IFS= read -r line; do
    # 코드 펜스 토글 (``` 로 시작하는 줄)
    if [[ "$line" =~ ^\`\`\` ]]; then
      in_fence=$(( 1 - in_fence ))
      continue
    fi
    [[ $in_fence -eq 1 ]] && continue

    # 줄에서 "→ path.md" 패턴 추출 (backtick 래핑 포함)
    while IFS= read -r ref; do
      [[ -z "$ref" ]] && continue
      [[ "$ref" == *"{"* ]] && continue   # 플레이스홀더 무시

      # 1) kor/ 루트 기준
      t="$(normalize "$KOR_DIR" "$ref")"
      [[ -n "$t" && -f "$t" ]] && continue
      # 2) 파일 디렉토리 기준
      t="$(normalize "$file_dir" "$ref")"
      [[ -n "$t" && -f "$t" ]] && continue
      # 3) 부모 디렉토리 기준 (도메인 루트에서 하위 폴더 참조)
      if [[ "$parent_dir" != "$KOR_DIR" && "$parent_dir" != "$REPO_ROOT" ]]; then
        t="$(normalize "$parent_dir" "$ref")"
        [[ -n "$t" && -f "$t" ]] && continue
      fi

      echo "BROKEN REF: $md_file"
      echo "  → $ref"
      ERRORS=$(( ERRORS + 1 ))
    done < <(echo "$line" | grep -oE '→ `?[^`{} ]+\.md`?' | sed 's/→ //;s/`//g' || true)
  done < "$md_file"

done < <(find "$KOR_DIR" -name "*.md" -print0)

if [[ $ERRORS -gt 0 ]]; then
  echo ""
  echo "lint-refs: $ERRORS broken reference(s) found in kor/"
  exit 1
else
  echo "lint-refs: all references OK"
fi
