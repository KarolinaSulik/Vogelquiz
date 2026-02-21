import Foundation

enum QuizLevel: String, CaseIterable, Identifiable {
    case level1
    case level2

    var id: String { rawValue }
}

enum QuestionKind {
    case identify(bird: Bird)
    case fact(bird: Bird)
}

struct QuizQuestion: Identifiable {
    let id = UUID()
    let kind: QuestionKind
    let question: String
    let options: [String]
    let correctAnswer: String
    let explanation: String
}

@MainActor
final class QuizViewModel: ObservableObject {
    
    @Published var birds: [Bird] = []
    @Published var ui: QuizUIStrings = .init(
        identifyQuestion: "…",
        factQuestionTemplate: "…",
        infoPrefix: "Info",
        continueButton: "…",
        loadingText: "…",
        scoreLabel: "…",
        questionProgressTemplate: "…",
        navigationTitle: "…",
        correctTitle: "…",
        wrongTitle: "…",
        startButton: "…",
        chooseLevelTitle: "…",
        level1Title: "…",
        level2Title: "…",
        restartLevel: "…",
        backToStart: "…",
        result: "…",
        resultScore: "…",
        textVogelStart: "…",
        repeatWrongQuestions: "…",
        doneButton: "…",
        birdsAtlas: "…",
        sectionDescription: "…",
        sectionCharacteristics: "…"

    )
    @Published var isLoaded = false
    private(set) var quizData: QuizData?
    
    
    func load(language: AppLanguage) {
        guard !isLoaded else { return }
        isLoaded = true
        do {
            let loadedBirds = try BirdRepository.loadBirds(language: language)
            let loadedUI = try BirdRepository.loadUI(language: language)
            
            self.birds = loadedBirds
            self.ui = loadedUI
            self.quizData = QuizData(birds: loadedBirds, ui: loadedUI)
        } catch {
            isLoaded = false
            print("JSON load error:", error)
        }
    }
    
    func questions(for level: QuizLevel) -> [QuizQuestion] {
        guard let quizData else { return [] }
        switch level {
        case .level1: return quizData.level1Questions()
        case .level2: return quizData.level2Questions()
        }
    }
    func levelTitle(_ level: QuizLevel) -> String {
        switch level {
        case .level1: return ui.level1Title
        case .level2: return ui.level2Title
        }
    }
    func loadForCurrentSystemLanguage() {
        let code = Locale.current.language.languageCode?.identifier ?? "en"
        let language: AppLanguage = code == "de" ? .de : .en
        load(language: language)
    }
}
