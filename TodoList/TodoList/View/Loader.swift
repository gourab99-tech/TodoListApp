import SwiftUI

struct Loader: View {
    @State private var isAnimating = false
    var body: some View {
        Text("Loading News...")
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .pink))
            .frame(width: 50, height: 50)
            .onAppear {
                withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                    self.isAnimating = true
                }
            }
            .onDisappear {
                self.isAnimating = false
            }
    }
}

struct ReusableLoaderDemo: View {
    var body: some View {
        VStack {
            Loader()
        }
        .padding()
    }
}

#Preview {
    ReusableLoaderDemo()
}
