# TypeScript Project (Bun)

default:
    @just --list

# フォーマット
fmt:
    bun x biome format . --write

# フォーマットチェック
fmt-check:
    bun x biome format . --check

# lint
lint:
    bun x biome check .

# 型チェック
typecheck:
    bun x tsc --noEmit

# テスト
test:
    bun test

# ビルド
build:
    bun run build

# CI 相当のチェック
check: fmt-check lint typecheck test

# 監視モード
watch:
    bun test --watch
