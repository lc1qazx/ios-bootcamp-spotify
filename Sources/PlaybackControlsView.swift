import SwiftUI

struct PlaybackControlsView: View {
    @State private var isPlaying = false

    var body: some View {
        HStack {
            Image(systemName: "shuffle")
                .foregroundStyle(.gray)
            Spacer()
            Image(systemName: "backward.end.fill")
            Spacer()

            Button {
                isPlaying.toggle()
            } label: {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.title2)
                    .foregroundStyle(.black)
                    .frame(width: 64, height: 64)
                    .background(.white, in: Circle())
            }
            .accessibilityLabel(isPlaying ? "Pause" : "Play")

            Spacer()
            Image(systemName: "forward.end.fill")
            Spacer()
            Image(systemName: "repeat")
                .foregroundStyle(.gray)
        }
        .font(.title3)
        .buttonStyle(.plain)
    }
}
