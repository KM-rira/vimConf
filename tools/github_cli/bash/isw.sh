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

# 引数の数をチェック
case "$#" in
    *)
        for arg in "$@"; do
            case "$arg" in
                a)
                    Type='--state all'
                    ;;
                o)
                    Type='--state open'
                    ;;
                c)
                    Type='--state closed'
                    ;;
                d)
                    Type='--draft'
                    ;;
                [1-9]*)
                    Limit=$arg
                    ;;
            esac
        done
        ;;
esac

cmd="gh issue list $Type --json title,url --repo $repo_name --limit $Limit2"

# GitHub CLIでリストをJSON形式で取得
json_data=$(eval $cmd)

titles=$(echo $json_data | jq -r '.[].title')

selected_title=$(echo "$titles" | fzf)

# 選択されたtitleに対応するurlを取得
selected_url=$(echo "$json_data" | jq -r --arg title "$selected_title" '.[] | select(.title == $title) | .url')

# 結果を表示
start "$selected_url"
