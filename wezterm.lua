local wezterm = require 'wezterm';
return {
    default_prog = {"wsl.exe"},
    -- default_prog = {"C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i"},
    color_scheme = "YourCustomScheme",
    colors = {
    foreground = "#eee8aa",
    background = "#2E3436",
    cursor_bg = "#f0246b",
    cursor_border = "#f0246b",
    cursor_fg = "#1C1C1C",
    selection_bg = "#FFA500",
    selection_fg = "#000000",
    ansi = {"#2E3436", "#CC0000", "#4E9A06", "#C4A000",
            "#3465A4", "#75507B", "#06989A", "#D3D7CF"},
    brights = {"#555753", "#EF2929", "#8AE234", "#FCE94F",
               "#729FCF", "#AD7FA8", "#34E2E2", "#EEEEEC"},
    },
    keys = {
        -- 次のタブに移動
        {key="Tab", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
        -- 前のタブに移動
        {key="Tab", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},
        -- windowキー無効化
        -- {key="v", mods="SUPER", action="Nop"},
        -- 1ページ上にスクロール
        {key="b", mods="ALT", action=wezterm.action{ScrollByPage=-1}},
        -- 1ページ下にスクロール
        {key="f", mods="ALT", action=wezterm.action{ScrollByPage=1}},
        -- 半ページを下にスクロール
        {key="d", mods="ALT", action=wezterm.action{ScrollByPage=-0.5}},
        -- 半ページを上にスクロール
        {key="u", mods="ALT", action=wezterm.action{ScrollByPage=0.5}},
        -- 一行上にスクロール
        {key="k", mods="ALT", action=wezterm.action{ScrollByLine=-1}},
        -- 一行下にスクロール
        {key="j", mods="ALT", action=wezterm.action{ScrollByLine=1}},
        -- ペインを垂直分割
        {key="v", mods="SHIFT|ALT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        -- ペインを水平分割
        {key="s", mods="SHIFT|ALT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        -- タブを左に移動
        { key = '<', mods = 'SHIFT|ALT', action = wezterm.action.MoveTabRelative(-1) },
        -- タブを右に移動
        { key = '>', mods = 'SHIFT|ALT', action = wezterm.action.MoveTabRelative(1) },
        -- 次のペインへ移動
        {key="l", mods="CTRL|ALT", action=wezterm.action{ActivatePaneDirection="Right"}},
        -- 前のペインへ移動
        {key="h", mods="CTRL|ALT", action=wezterm.action{ActivatePaneDirection="Left"}},
        -- 上下のペイン間を移動するための追加のショートカット
        {key="j", mods="CTRL|ALT", action=wezterm.action{ActivatePaneDirection="Down"}},
        {key="k", mods="CTRL|ALT", action=wezterm.action{ActivatePaneDirection="Up"}},
        -- 矢印キーを使用してペインのサイズを調整
        {key="l", mods="SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Right", 1}}},
        {key="h", mods="SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Left", 1}}},
        {key="k", mods="SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Up", 1}}},
        {key="j", mods="SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Down", 1}}},
        -- アクティブなペインを閉じる
        {key="w", mods="ALT", action=wezterm.action{CloseCurrentPane={confirm=true}}},
        -- 文字の大きさを増やす
        {key="+", mods="SHIFT|ALT", action="IncreaseFontSize"},
        -- 文字の大きさを減らす
        {key="=", mods="SHIFT|ALT", action="DecreaseFontSize"},
        -- 文字の大きさをリセット
        {key="0", mods="SHIFT|ALT", action="ResetFontSize"},
        { key = 'x', mods = 'SHIFT|CTRL', action = wezterm.action.QuickSelect },
        {
          key = 'c',
          mods = 'CTRL',
          action = wezterm.action{CopyTo = "Clipboard"},
        },
        {
          key = "v",
          mods = "CTRL",
          action = wezterm.action{PasteFrom = "Clipboard"},
        },
        -- Ctrl + Shift + C/V を無効化
        {
          key = 'C',
          mods = 'CTRL|SHIFT',
          action = wezterm.action.SendKey { key = 'c', mods = 'CTRL' },
        },
        {
          key = "v",
          mods = "CTRL|SHIFT",
          action = wezterm.action.Nop,
        },
        {
          key = "M",
          mods = "CTRL|SHIFT",
          action = wezterm.action.ActivateCopyMode,
        },
    },
    audible_bell = "Disabled",
    font_size = 7.7,
}

