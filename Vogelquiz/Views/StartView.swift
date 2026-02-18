import Foundation
import SwiftUI

struct StartView: View {
    @ObservedObject var vm: QuizViewModel
    let onSelectLevel: (QuizLevel) -> Void

    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            VStack(spacing: 48) {
                Text("Vogelquiz")
                    .font(.largeTitle)
                    .bold()
                VStack(alignment: .leading, spacing: 16){
                    Text(vm.ui.chooseLevelTitle)
                        .font(.headline)

                    ForEach(QuizLevel.allCases, id: \.self) { level in
                        VStack(alignment: .leading, spacing: 16) {
                            AppButton(title: vm.levelTitle(level)) {
                                onSelectLevel(level)
                            }
                        }
                    }
                    Spacer()
                        .frame(height: 32)
                    Text(vm.ui.textVogelStart)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                Spacer()
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

