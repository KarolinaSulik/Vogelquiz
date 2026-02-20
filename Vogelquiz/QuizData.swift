import Foundation

struct QuizData {

    let birds: [Bird]
    let ui: QuizUIStrings



    // MARK: - Level 1: Identify
    //make the identify question with 4 answers
    
    func level1Questions() -> [QuizQuestion] {
         let allNames = birds.map { $0.name }// from every bird take only the name

            func makeIdentifyQuestion(for bird: Bird) -> QuizQuestion {
                // Choose 3 wrong options + 1 correct, shuffled
                let wrong = allNames.filter { $0 != bird.name }.shuffled().prefix(3)
                let opts = ([bird.name] + wrong).shuffled()

                return QuizQuestion(
                    kind: .identify(bird: bird),
                    question: ui.identifyQuestion,
                    options: opts,
                    correctAnswer: bird.name,
                    explanation: "\n\(bird.name)"
                )
            }
        // Make one question per every bird
            return birds.map { makeIdentifyQuestion(for: $0) }.shuffled()
        }
    
    // MARK: - Level 2: Facts
    func level2Questions() -> [QuizQuestion] {
        birds.map { bird in
            QuizQuestion(
                kind: .fact(bird: bird),
                question: ui.factQuestionTemplate.replacingOccurrences(of: "{name}", with: bird.name),
                options: makeFactOptions(for: bird),
                correctAnswer: bird.fact,
                explanation: "\n\(bird.fact)"
            )
        }
        .shuffled()
    }
    
    //make the fact question with 4 answers
    private func makeFactOptions(for correctBird: Bird) -> [String] {
           let otherFacts = birds
               .filter { $0.id != correctBird.id }
               .map { $0.fact }
               .shuffled()
               .prefix(3)

           return ([correctBird.fact] + otherFacts).shuffled()
    }
    
}
