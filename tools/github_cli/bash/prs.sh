#!/bin/bash

source ~/vimConf/tools/github_cli/bash/config.sh

# Gitリポジトリのorigin URLを取得
repo_url=$(git config --get remote.origin.url)

# URLからリポジトリ名を抽出
selected_repo=$(echo $repo_url | sed -e 's/.*://' -e 's/\.git$//')

# リポジトリ名の抽出失敗した場合
if [ -z "$selected_repo" ]; then
    # GitHubのリポジトリ一覧を取得し、fzfで選択させる
    selected_repo=$(gh repo list ${gh_user} --limit ${Limit1} | fzf)
fi

# 選択されたリポジトリからリポジトリ名を抜き取る
repo_name=$(echo "$selected_repo" | awk '{print $1}')

gh pr status --repo "$repo_name"
