import SwiftUI

struct PlaybackControlsView: View {
    // Binding lets this child view change the parent view's state.
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
            .accessibilityLabel(isShuffling ? "Turn shuffle off" : "Turn shuffle on")
            Spacer(minLength: 8)
            Button(action: previous) {
                Image(systemName: "backward.end.fill").font(.title2).frame(width: 44, height: 48)
            }
            .accessibilityLabel("Back to start")
            Spacer(minLength: 8)
            Button { isPlaying.toggle() } label: {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(.black)
                    .offset(x: isPlaying ? 0 : 2)
                    .frame(width: 68, height: 68)
                    .background(.white, in: Circle())
            }
            .accessibilityLabel(isPlaying ? "Pause preview" : "Play preview")
            Spacer(minLength: 8)
            Button(action: next) {
                Image(systemName: "forward.end.fill").font(.title2).frame(width: 44, height: 48)
            }
            .accessibilityLabel("Skip to end")
            Spacer(minLength: 8)
            Button { isRepeating.toggle() } label: {
                Image(systemName: "repeat")
                    .foregroundStyle(isRepeating ? green : .white.opacity(0.7))
                    .frame(width: 44, height: 48)
            }
            .accessibilityLabel(isRepeating ? "Turn repeat off" : "Turn repeat on")
        }
        .font(.title3)
        .foregroundStyle(.white)
        .buttonStyle(.plain)
    }
}
