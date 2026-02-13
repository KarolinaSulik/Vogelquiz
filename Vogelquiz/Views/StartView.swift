import Foundation
import SwiftUI

struct StartView: View {
    let onSelectLevel: (QuizLevel) -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Vogelquiz")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Choose a level")
                .foregroundStyle(.secondary)

            ForEach(QuizLevel.allCases) { level in
                Button {
                    onSelectLevel(level)
                } label: {
                    Text(level.title)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(12)
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Start")
    }
}

