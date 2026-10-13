import SwiftUI

struct PlaybackControlsView: View {
    // Binding 让子视图读写父视图的 State，而不是另建一份不相关的数据。
    @Binding var isPlaying: Bool
    @Binding var isShuffling: Bool
    @Binding var isRepeating: Bool
    let previous: () -> Void
    let next: () -> Void
    private let green = Color(red: 0.12, green: 0.84, blue: 0.39)

    var body: some View {
        HStack(spacing: 0) {
            Button { isShuffling.toggle() } label: {
                Image(systemName: "shuffle")
                    .foregroundStyle(isShuffling ? green : .white.opacity(0.7))
                    .frame(width: 44, height: 48)
            }
            .accessibilityLabel(isShuffling ? "关闭随机播放" : "开启随机播放")
            Spacer(minLength: 8)
            Button(action: previous) {
                Image(systemName: "backward.end.fill").font(.title2).frame(width: 44, height: 48)
            }
            .accessibilityLabel("回到开头")
            Spacer(minLength: 8)
            Button { isPlaying.toggle() } label: {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(.black)
                    .offset(x: isPlaying ? 0 : 2)
                    .frame(width: 68, height: 68)
                    .background(.white, in: Circle())
            }
            .accessibilityLabel(isPlaying ? "暂停预览" : "播放预览")
            Spacer(minLength: 8)
            Button(action: next) {
                Image(systemName: "forward.end.fill").font(.title2).frame(width: 44, height: 48)
            }
            .accessibilityLabel("跳到结尾")
            Spacer(minLength: 8)
            Button { isRepeating.toggle() } label: {
                Image(systemName: "repeat")
                    .foregroundStyle(isRepeating ? green : .white.opacity(0.7))
                    .frame(width: 44, height: 48)
            }
            .accessibilityLabel(isRepeating ? "关闭循环播放" : "开启循环播放")
        }
        .font(.title3)
        .foregroundStyle(.white)
        .buttonStyle(.plain)
    }
}
