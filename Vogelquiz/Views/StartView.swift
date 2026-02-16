import Foundation
import SwiftUI

struct StartView: View {
    @ObservedObject var vm: QuizViewModel
    let onSelectLevel: (QuizLevel) -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Vogelquiz")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(vm.ui.chooseLevelTitle)
                .foregroundStyle(.secondary)

            ForEach(QuizLevel.allCases, id: \.self) { level in
                Button {onSelectLevel(level)} label: {
                    Text(vm.levelTitle(level))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(12)
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle(vm.ui.startButton)
    }
}

