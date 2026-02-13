import Foundation
import SwiftUI

struct QuizView: View {
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
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(level.shortTitle)
                    .font(.headline)
                Spacer()
                Text("Score: \(score)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            if questions.isEmpty {
                ProgressView("Loading…")
                    .onAppear {
                        loadQuestions()
                    }
            } else if index < questions.count {
                Text("Question \(index + 1) of \(questions.count)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                questionView(for: questions[index])
            } else {
                ResultView(
                    score: score,
                    total: questions.count,
                    onRestart: {restart()},
                    onBackToStart: {onBackToStart()}
                )
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Vogelquiz")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
                  ToolbarItem(placement: .topBarLeading) {
                      Button {
                          onCancel()   // <- to ustawia selectedLevel = nil w rodzicu
                      } label: {
                          Image(systemName: "chevron.left")                      }
                  }
              }
        .alert(lastWasCorrect ? "Correct ✅" : "Wrong ❌", isPresented: $showFeedback, actions: {
            Button("Continue") {
                goNext()
            }
        }, message: {
            Text(lastExplanation)
        })
    }

    @ViewBuilder
    private func questionView(for q: QuizQuestion) -> some View {
        VStack(alignment: .leading, spacing: 12) {

            // For now no images; later we will show image for level 1
            Text(q.question)
                .font(.title2)
                .fontWeight(.semibold)

            VStack(spacing: 10) {
                ForEach(q.options, id: \.self) { option in
                    Button {
                        handleAnswer(option, question: q)
                    } label: {
                        Text(option)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(.thinMaterial)
                            .cornerRadius(12)
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
        loadQuestions()
    }

    private func loadQuestions() {
        switch level {
        case .level1:
            questions = QuizData.level1Questions()
        case .level2:
            questions = QuizData.level2Questions()
        }
    }
}
