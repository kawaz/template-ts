# Project

<!-- プロジェクトの概要をここに記述 -->

## Commands

```bash
just fmt        # Biome フォーマット
just lint       # Biome lint
just typecheck  # TypeScript 型チェック
just test       # Bun test
just check      # CI 相当（fmt-check + lint + typecheck + test）
just build      # ビルド（Bun bundle + tsc declarations）
```

## Structure

```
src/                # ソースコード
dist/               # ビルド出力
.github/workflows/  # CI/CD
```

## Guidelines

- コミットメッセージ: Conventional Commits (feat:, fix:, chore:, docs:, refactor:)
- テストファースト開発
- Biome でフォーマット・lint 統一
- `"type": "module"` (ESM)
