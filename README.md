# 音乐播放器练习

iOS Bootcamp Project 1 的初稿，界面参考 Spotify。先把基础界面做出来，后面继续修改。

## 怎么运行

用 Xcode 打开 `SpotifyPlayer.xcodeproj`，选择 `SpotifyPlayer` 和一个 iPhone 模拟器，点击 ▶。模拟器还没下载好时，可以选择 `My Mac (Mac Catalyst)` 先看界面。

## 现在有什么

- 专辑封面、歌名、歌手、播放进度。
- 播放 / 暂停、收藏、随机和循环按钮的状态切换。
- 拖动进度条会改变时间显示。

目前是界面练习，不播放真正的音乐。

## 后面从哪里改

- `ContentView.swift`：歌名、背景、布局、间距。
- `PlaybackControlsView.swift`：播放按钮和状态。
- `AlbumArtworkView.swift`：封面。

使用 SwiftUI，iOS / Mac 构建已通过；iPhone 模拟器检查还在等待运行环境下载。

初稿使用 Codex 协助，后续会继续学习和修改。

[Project 1 说明](https://appteamcarolina.notion.site/Project-1-9d6c96c1ce73835bbe00814a83ee1c27)
