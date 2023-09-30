#!/bin/bash

# 複数のエイリアスを効率的に`.bashrc`に追加するためには、スクリプトを一般化して、追加したいエイリアスを簡単にリストに追加できるようにすると便利です。
# 以下のスクリプトは、追加したいエイリアスを配列として列挙し、それらのエイリアスが`.bashrc`に存在しない場合にだけ追加します：

# bashrcに下記を追加。（非同期で）
# ~/vimConf/addAlias.sh

# .bashrcのパス
BASHRC="$HOME/.bashrc"

# 追加したいエイリアスをこの配列に列挙
declare -A aliases
aliases["historygrep"]="history | grep"

# 各エイリアスをチェック
for key in "${!aliases[@]}"; do
    # aliasが存在するかチェック
    grep -q "alias $key='${aliases[$key]}'" $BASHRC
    if [ $? -ne 0 ]; then
        echo "alias $key='${aliases[$key]}'" >> $BASHRC
        echo "alias $key='${aliases[$key]}' was added to .bashrc."
    else
        echo "alias $key='${aliases[$key]}' already exists in .bashrc."
    fi
done

echo "Done updating .bashrc."