import SwiftUI

struct ContentView: View {

    @State private var selectedLevel: QuizLevel? = nil

    var body: some View {
        NavigationStack {
            if let level = selectedLevel {
                QuizScreen(level: level) {
                    selectedLevel = nil
                }
            } else {
                StartScreen { level in
                    selectedLevel = level
                }
            }
        }
    }
}

struct StartScreen: View {
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
                    Text(level.rawValue)
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

struct QuizScreen: View {
    let level: QuizLevel
    let onBackToStart: () -> Void

    @State private var questions: [QuizQuestion] = []
    @State private var index: Int = 0
    @State private var score: Int = 0

    @State private var showFeedback: Bool = false
    @State private var lastWasCorrect: Bool = false
    @State private var lastExplanation: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            HStack {
                Text(levelTitle)
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
        .alert(lastWasCorrect ? "Correct ✅" : "Wrong ❌", isPresented: $showFeedback, actions: {
            Button("Continue") {
                goNext()
            }
        }, message: {
            Text(lastExplanation)
        })
    }

    private var levelTitle: String {
        switch level {
        case .level1: return "Identify the Bird"
        case .level2: return "Bird Facts"
        }
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

#Preview {
    ContentView()
}
