import SwiftUI
import Foundation

struct ResultView: View {
    let score: Int
    let total: Int
    let onRestart: () -> Void
    let onBackToStart: () -> Void
    let wrongCount: Int
    let onRetryWrong: () -> Void
    @ObservedObject var vm: QuizViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(vm.ui.result)
                .font(.title)
                .fontWeight(.bold)
            Text(
                vm.ui.resultScore
                    .replacingOccurrences(of: "{score}", with: "\(score)")
                    .replacingOccurrences(of: "{total}", with: "\(total)")
            )
            .font(.headline)
            VStack(alignment: .leading, spacing: 16) {
                if wrongCount > 0 {
                    let title = vm.ui.repeatWrongQuestions
                        .replacingOccurrences(of: "{wrongCount}", with: "\(wrongCount)")
                    AppButton(title: title, action: onRetryWrong)
                }
                AppButton(title: vm.ui.restartLevel, action: onRestart)
                AppButton(title: vm.ui.backToStart, action: onBackToStart)
            }
        }
        .padding(.top, 8)
    }
}
