# After Hours — 音乐播放器 UI 初版

iOS Bootcamp Project 1 的 SwiftUI 界面练习。灵感来自 Spotify 的播放页面，使用原创几何封面与虚构曲目。

## 打开与运行

1. 用 Xcode 打开 `SpotifyPlayer.xcodeproj`。
2. Scheme 选择 `SpotifyPlayer`。
3. 选择一个已安装的 iPhone Simulator，点击 ▶ 或按 Command-R。
4. 没有模拟器时，可选择 `My Mac (Mac Catalyst)` 查看同一套 SwiftUI 界面。

使用 Swift / SwiftUI，最低 iOS 17，无第三方依赖。模拟器无需开发者付费账号；真机签名尚未配置。

## 已实现

- 播放页面、原创封面、歌曲和歌手信息。
- 播放 / 暂停、收藏、随机、循环状态切换。
- 可拖动的进度条；开头 / 结尾按钮；时间标签联动。
- 歌曲说明展开 / 收起。
- VoiceOver 标签、滚动布局。

这些是 UI 状态演示，不播放音频，不连接 Spotify，不获取个人数据。

## 从哪里开始修改

| 文件 | 内容 | 可以尝试的改动 |
|---|---|---|
| `Sources/ContentView.swift` | 整体布局、State、曲名、进度 | 换歌名、调间距、改背景 |
| `Sources/PlaybackControlsView.swift` | 按钮与 Binding | 调图标、观察子视图如何修改父视图的状态 |
| `Sources/AlbumArtworkView.swift` | SwiftUI 几何封面 | 改颜色，或替换成你放入 Assets 的 Image |
| `Sources/SpotifyPlayerApp.swift` | App 入口 | 理解 WindowGroup 与首个 View |

学习重点：VStack 纵向排列、HStack 横向排列、ZStack 叠放；修饰符改变外观；State 持有页面数据，Binding 让子视图修改相同数据。

## 检查记录

- Xcode 27：iOS Simulator SDK / arm64 构建通过。
- Mac Catalyst 构建通过，并实际启动。
- 实际验证播放、收藏、随机、循环状态切换和进度重置。
- iPhone 模拟器运行及其截图：等待 runtime 下载完成。

## 初版来源与后续

本初版由 Codex 根据课程要求辅助编写。请阅读、理解并进行自己的调整；按 club 对 AI 辅助的规定提交。代码没有被标记为完全由学生独立完成。

后续可自己更换封面、完善动态字体与不同手机尺寸布局。音频播放不属于本次课程要求。

[课程要求](https://appteamcarolina.notion.site/Project-1-9d6c96c1ce73835bbe00814a83ee1c27)
