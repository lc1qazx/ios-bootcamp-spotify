import SwiftUI

struct ContentView: View {
    // State belongs to this view. Changing it updates the related UI.
    @State private var isPlaying = false
    @State private var isLiked = false
    @State private var isShuffling = false
    @State private var isRepeating = false
    @State private var progress = 83.0
    @State private var showLyrics = false
    private let duration = 234.0
    private let green = Color(red: 0.12, green: 0.84, blue: 0.39)

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 0.14, green: 0.30, blue: 0.26), .black],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 26) {
                    header
                    AlbumArtworkView()
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(color: .black.opacity(0.30), radius: 24, y: 14)
                        .accessibilityLabel("Original geometric cover for Night Drive")

                    HStack(spacing: 18) {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("Night Drive").font(.title.bold())
                            Text("Luna Coast").font(.subheadline).foregroundStyle(.white.opacity(0.65))
                        }
                        Spacer()
                        Button {
                            isLiked.toggle()
                        } label: {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .font(.title2)
                                .foregroundStyle(isLiked ? green : .white.opacity(0.8))
                                .frame(width: 44, height: 44)
                        }
                        .accessibilityLabel(isLiked ? "Remove from favorites" : "Add to favorites")
                    }

                    VStack(spacing: 0) {
                        Slider(value: $progress, in: 0...duration)
                            .tint(.white)
                            .accessibilityLabel("Playback progress")
                        HStack {
                            Text(timeLabel(progress))
                            Spacer()
                            Text("−" + timeLabel(duration - progress))
                        }
                        .font(.caption.monospacedDigit())
                        .foregroundStyle(.white.opacity(0.6))
                    }

                    PlaybackControlsView(isPlaying: $isPlaying,
                                         isShuffling: $isShuffling,
                                         isRepeating: $isRepeating,
                                         previous: { progress = 0 },
                                         next: { progress = duration })

                    HStack {
                        Label("Player preview", systemImage: "hifispeaker.fill")
                            .font(.caption).foregroundStyle(green)
                        Spacer()
                        Button { showLyrics.toggle() } label: {
                            Image(systemName: "text.alignleft")
                                .font(.title3).frame(width: 44, height: 44)
                        }
                        .accessibilityLabel(showLyrics ? "Hide track information" : "Show track information")
                    }

                    if showLyrics {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("ABOUT THIS TRACK").font(.caption.bold()).tracking(2)
                            Text("A little soundtrack for the long way home.")
                                .font(.title3.weight(.semibold))
                            Text("This is a UI demo. Playback controls change the interface; no audio is played.")
                                .font(.caption).foregroundStyle(.white.opacity(0.7))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                        .background(.white.opacity(0.09), in: RoundedRectangle(cornerRadius: 16))
                    }
                }
                .padding(.horizontal, 28)
                .padding(.top, 12)
                .padding(.bottom, 24)
                .frame(maxWidth: 480)
                .frame(maxWidth: .infinity)
            }
        }
    }

    private var header: some View {
        HStack {
            Image(systemName: "chevron.down").font(.title3).frame(width: 32, height: 44)
            Spacer()
            VStack(spacing: 4) {
                Text("PLAYING FROM PLAYLIST").font(.system(size: 9, weight: .medium)).tracking(1.5)
                Text("After Hours").font(.subheadline.bold())
            }
            Spacer()
            Menu {
                Button(isLiked ? "Remove from favorites" : "Add to favorites") { isLiked.toggle() }
                Button("Reset progress") { progress = 0 }
            } label: {
                Image(systemName: "ellipsis").font(.title3).frame(width: 32, height: 44)
            }
            .accessibilityLabel("Track options")
        }
        .foregroundStyle(.white)
    }

    private func timeLabel(_ seconds: Double) -> String {
        let value = Int(seconds)
        return String(format: "%d:%02d", value / 60, value % 60)
    }
}

#Preview { ContentView().preferredColorScheme(.dark) }
