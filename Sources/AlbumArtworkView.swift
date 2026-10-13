import SwiftUI

/// A SwiftUI cover. Replace this view with Image("YourAsset") to use your own picture.
struct AlbumArtworkView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(colors: [Color(red: 0.06, green: 0.19, blue: 0.20),
                                        Color(red: 0.14, green: 0.43, blue: 0.38)],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                Circle()
                    .fill(Color(red: 0.91, green: 0.85, blue: 0.61))
                    .frame(width: geometry.size.width * 0.42)
                    .offset(x: geometry.size.width * 0.16, y: -geometry.size.height * 0.03)
                Canvas { context, size in
                    // Repeat a curve to create a road-like pattern.
                    for index in 0..<22 {
                        let fraction = CGFloat(index) / 21
                        var path = Path()
                        path.move(to: CGPoint(x: -size.width * 0.2, y: size.height * (0.45 + fraction * 0.45)))
                        path.addCurve(to: CGPoint(x: size.width * 1.2, y: size.height * (0.72 + fraction * 0.35)),
                                      control1: CGPoint(x: size.width * 0.52, y: size.height * (0.05 + fraction * 0.55)),
                                      control2: CGPoint(x: size.width * 0.30, y: size.height * (1.20 + fraction * 0.2)))
                        context.stroke(path, with: .color(.black.opacity(0.34)), lineWidth: 4)
                    }
                }
                VStack(alignment: .leading) {
                    Text("LUNA COAST").font(.system(size: 10, weight: .medium)).tracking(3)
                    Spacer()
                    Text("NIGHT\nDRIVE")
                        .font(.system(size: geometry.size.width * 0.14, weight: .black, design: .rounded))
                        .tracking(-2)
                        .lineSpacing(-4)
                    HStack {
                        Text("VOL. 01").tracking(2)
                        Spacer()
                        Text("STEREO").tracking(2)
                    }
                    .font(.system(size: 8, weight: .semibold))
                    .padding(.top, 8)
                }
                .foregroundStyle(Color(red: 0.97, green: 0.95, blue: 0.84))
                .padding(24)
            }
            .clipped()
        }
    }
}
