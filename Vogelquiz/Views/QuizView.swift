import Foundation
import SwiftUI

struct QuizView: View {
    @ObservedObject var vm: QuizViewModel
    let level: QuizLevel
    let onBackToStart: () -> Void
    let onCancel: () -> Void
    
    @State private var questions: [QuizQuestion] = []
    @State private var index: Int = 0
    @State private var score: Int = 0
    @State private var showFeedback: Bool = false
    @State private var lastWasCorrect: Bool = false
    @State private var lastExplanation: String = ""
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                if questions.isEmpty {
                    ProgressView(vm.ui.loadingText)
                } else if index < questions.count {
                    HStack {
                        Text(
                            vm.ui.questionProgressTemplate
                                .replacingOccurrences(of: "{current}", with: "\(index + 1)")
                                .replacingOccurrences(of: "{total}", with: "\(questions.count)")
                        )
                        .font(.subheadline)
                        .foregroundStyle(Color("AppText").opacity(0.7))
                        Spacer()
                        Text("\(vm.ui.scoreLabel): \(score)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    questionView(for: questions[index])
                } else {
                    ResultView(
                        score: score,
                        total: questions.count,
                        onRestart: {restart()},
                        onBackToStart: {onBackToStart()},
                        vm: vm
                    )
                }
                Spacer()
            }
            .padding()
            .navigationTitle(vm.ui.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        onCancel()   // <- to ustawia selectedLevel = nil w rodzicu
                    } label: {
                        Image(systemName: "chevron.left")                      }
                }
            }
            .alert(lastWasCorrect ? vm.ui.correctTitle : vm.ui.wrongTitle, isPresented: $showFeedback, actions: {
                Button(vm.ui.continueButton) {
                    goNext()
                }
            }, message: {
                Text(lastExplanation)
            })
            .onAppear {
                questions = vm.questions(for: level)
            }
            .onChange(of: level) { _, newLevel in
                questions = vm.questions(for: newLevel)
                index = 0
                score = 0
            }
        }
    }

    @ViewBuilder
    private func questionView(for q: QuizQuestion) -> some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(q.question)
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            switch q.kind {
            case .identify(let bird), .fact(let bird):
                Image(bird.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 220)
                    .clipShape(RoundedRectangle(cornerRadius:  18 , style: .continuous))
                    .background {
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(.thinMaterial)
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .stroke(.quaternary, lineWidth: 1)
                    }
                    .shadow(radius: 10, y: 6)
            }
            VStack(spacing: 8) {
                ForEach(q.options, id: \.self) { option in
                    AppButton(title: option) {
                        handleAnswer(option, question: q)
                    }
                }
            }
        }
    }
    
    private func handleAnswer(_ selected: String, question: QuizQuestion) {
        let isCorrect = (selected == question.correctAnswer)
        if isCorrect { score += 1 }

        lastWasCorrect = isCorrect
        lastExplanation = question.explanation
        showFeedback = true
    }

    private func goNext() {
        index += 1
    }

    private func restart() {
        score = 0
        index = 0
        questions = vm.questions(for: level)
    }
}
