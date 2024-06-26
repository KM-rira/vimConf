#!/bin/bash

# コマンド履歴を取得してfzfでフィルタリング
cd $(git rev-parse --show-toplevel)
select_file=$( git diff --name-only --cached | fzf --no-sort --prompt='SELECT STAGING RESTORE FILE: ' --multi)

# リポジトリ名の抽出失敗した場合
if [ -z "$select_file" ] ; then
    echo "===== EXIT PROCESS ====="
    exit
fi

# 選択されたコマンドを実行
git restore --staged $select_file

echo "===== DONE ====="