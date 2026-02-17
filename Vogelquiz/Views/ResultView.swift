import SwiftUI
import Foundation

struct ResultView: View {
    let score: Int
    let total: Int
    let onRestart: () -> Void
    let onBackToStart: () -> Void
    @ObservedObject var vm: QuizViewModel

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
                Text(vm.ui.restartLevel)
                    .font(.body.weight(.semibold))
                    .foregroundStyle(Color("AppText").opacity(0.7))
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color("AppButtonBackground"))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color("AppText").opacity(0.06), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            }
            .buttonStyle(.plain)

            Button {
                onBackToStart()
            } label: {
                Text(vm.ui.backToStart)
                    .font(.body.weight(.semibold))
                    .foregroundStyle(Color("AppText").opacity(0.7))
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color("AppButtonBackground"))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color("AppText").opacity(0.06), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            }
            .buttonStyle(.plain)
        }
        .padding(.top, 8)
    }
}
