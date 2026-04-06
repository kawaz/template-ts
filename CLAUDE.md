# Project

<!-- プロジェクトの概要をここに記述 -->

## Commands

```bash
just fmt        # Biome フォーマット
just lint       # Biome lint
just typecheck  # TypeScript 型チェック
just test       # Bun test
just check      # CI 相当（lint + typecheck）
just build      # ビルド（Bun bundle + tsc declarations）
just push       # check + test してから push
just release    # リリース（version bump + push）
```

## Structure

```
src/                # ソースコード
dist/               # ビルド出力
.github/workflows/  # CI/CD
  ci.yml            # テスト（push/PR）
  publish.yml       # npm publish（package.json version 変更トリガー）
```

## Guidelines

- コミットメッセージ: Conventional Commits (feat:, fix:, chore:, docs:, refactor:)
- テストファースト開発
- Biome でフォーマット・lint 統一
- `"type": "module"` (ESM)
- `just check` を通してから push
- push は `just push` を使う（直接 push は hook でブロック）
- リリースは `just release` で自動化
