import SwiftUI

struct AlbumArtworkView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 0.1, green: 0.3, blue: 0.3), .black],
                           startPoint: .topLeading, endPoint: .bottomTrailing)

            Image(systemName: "moon.stars.fill")
                .font(.system(size: 86))
                .foregroundStyle(.yellow.opacity(0.85))

            VStack(alignment: .leading) {
                Text("THE 1975")
                    .font(.caption)
                Spacer()
                Text("THE 1975")
                    .font(.largeTitle.bold())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
        }
        .foregroundStyle(.white)
    }
}
