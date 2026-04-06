# TypeScript Project (Bun)

# デフォルト: レシピ一覧
default:
    @just --list

# フォーマット
fmt:
    bun x biome format . --write

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

# lint + format + typecheck チェック
check:
    bun x biome check .
    bun x tsc --noEmit

# ワーキングコピーがクリーン（empty）であることを確認
ensure-clean:
    test "$(jj log -r @ --no-graph -T 'empty')" = "true"

# push (check + test を通してから push)
push: check test
    jj git push

# CI 相当のチェック
ci: check test build

# クリーン
clean:
    rm -rf dist node_modules

# 監視モード
watch:
    bun test --watch

# リリース (bump: major, minor, patch)
release bump="patch": ensure-clean check test build
    #!/usr/bin/env bash
    set -euo pipefail
    current=$(jq -r '.version' package.json)
    npm version {{bump}} --no-git-tag-version
    new_version=$(jq -r '.version' package.json)
    echo "Version: ${current} -> ${new_version}"
    jj describe -m "Release v${new_version}"
    jj new
    jj bookmark set main -r @-
    just push
    gh run watch
