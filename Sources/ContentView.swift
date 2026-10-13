import SwiftUI

struct ContentView: View {
    @State private var isLiked = false
    @State private var progress = 18.0
    let duration = 79.0
    let green = Color(red: 0.12, green: 0.84, blue: 0.39)

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 0.14, green: 0.3, blue: 0.26), .black],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 26) {
                    HStack {
                        Image(systemName: "chevron.down")
                        Spacer()
                        VStack(spacing: 4) {
                            Text("PLAYING FROM ALBUM")
                                .font(.caption2)
                            Text("The 1975")
                                .font(.subheadline.bold())
                        }
                        Spacer()
                        Image(systemName: "ellipsis")
                    }

                    AlbumArtworkView()
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 8))

                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("The 1975")
                                .font(.title.bold())
                            Text("The 1975")
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        Button {
                            isLiked.toggle()
                        } label: {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .font(.title2)
                                .foregroundStyle(isLiked ? green : .white)
                                .frame(width: 44, height: 44)
                        }
                        .accessibilityLabel("Favorite")
                    }

                    VStack(spacing: 4) {
                        Slider(value: $progress, in: 0...duration)
                            .tint(.white)
                        HStack {
                            Text(timeLabel(progress))
                            Spacer()
                            Text("-" + timeLabel(duration - progress))
                        }
                        .font(.caption)
                        .foregroundStyle(.gray)
                    }

                    PlaybackControlsView()

                    HStack {
                        Image(systemName: "hifispeaker.fill")
                            .foregroundStyle(green)
                        Spacer()
                        Image(systemName: "list.bullet")
                    }
                }
                .padding(28)
            }
        }
        .foregroundStyle(.white)
    }

    func timeLabel(_ seconds: Double) -> String {
        let value = Int(seconds)
        return String(format: "%d:%02d", value / 60, value % 60)
    }
}

#Preview {
    ContentView()
}
