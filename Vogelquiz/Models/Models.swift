import Foundation

enum QuizLevel: String, CaseIterable, Identifiable {
    case level1 = "Level 1: Identify the Bird"
    case level2 = "Level 2: Bird Facts"
    
    var id: String { title }

       var title: String {
           switch self {
           case .level1: return "Level 1: Identify the Bird"
           case .level2: return "Level 2: Bird Facts"
           }
       }

       var shortTitle: String {
           switch self {
           case .level1: return "Identify the Bird"
           case .level2: return "Bird Facts"
           }
       }
}

struct Bird: Identifiable, Hashable {
    let id = UUID()
    let name: String           // e.g., "Amsel"
    let scientificName: String // e.g., "Turdus merula"
    let hint: String           // short hint for Level 1
    let fact: String           // short fact for Level 2
    let imageName: String?     // later: Assets name (optional)
}

enum QuestionKind {
    case identify(bird: Bird)  // Level 1
    case fact(bird: Bird)      // Level 2
}

struct QuizQuestion: Identifiable {
    let id = UUID()
    let kind: QuestionKind
    let question: String
    let options: [String]
    let correctAnswer: String
    let explanation: String
}
