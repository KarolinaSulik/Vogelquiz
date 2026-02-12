import SwiftUI
import Foundation

struct ResultView: View {
    let score: Int
    let total: Int
    let onRestart: () -> Void
    let onBackToStart: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Result")
                .font(.title)
                .fontWeight(.bold)

            Text("You scored \(score) out of \(total).")
                .font(.headline)

            Button {
                onRestart()
            } label: {
                Text("Restart level")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(12)
            }

            Button {
                onBackToStart()
            } label: {
                Text("Back to start")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(12)
            }
        }
        .padding(.top, 8)
    }
}
