import SwiftUI

struct AlbumArtworkView: View {
    var body: some View {
        Image("AlbumCover")
            .resizable()
            .scaledToFit()
            .accessibilityLabel("The 1975 album cover")
    }
}
