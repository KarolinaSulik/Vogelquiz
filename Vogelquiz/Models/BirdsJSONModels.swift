import Foundation

// MARK: - Root JSON

struct BirdsRoot: Codable {
    let ui: UISection
    let birds: [BirdJSON]
}

struct UISection: Codable {
    let identifyQuestion: LocalizedString
    let factQuestionTemplate: LocalizedString
    let infoPrefix: LocalizedString
    let continueButton: LocalizedString
    let loadingText: LocalizedString
    let scoreLabel: LocalizedString
    let questionProgressTemplate: LocalizedString
    let navigationTitle: LocalizedString
    let correctTitle: LocalizedString
    let wrongTitle: LocalizedString
    let startButton: LocalizedString
    let chooseLevelTitle: LocalizedString
    let level1Title: LocalizedString
    let level2Title: LocalizedString
    let restartLevel: LocalizedString
    let backToStart: LocalizedString
    let result: LocalizedString
    let resultScore: LocalizedString
}

struct LocalizedString: Codable {
    let de: String
    let en: String
}

enum AppLanguage: String {
    case de
    case en
}

// MARK: - Birds JSON

struct BirdJSON: Codable {
    let id: String
    let scientificName: String
    let imageName: String
    let text: BirdText
}

struct BirdText: Codable {
    let de: BirdTextLang
    let en: BirdTextLang
}

struct BirdTextLang: Codable {
    let name: String
    let hint: String
    let fact: String
}

struct Bird: Identifiable, Hashable {
    let id: String
    let name: String           // e.g., "Amsel"
    let scientificName: String // e.g., "Turdus merula"
    let hint: String           // short hint for Level 1
    let fact: String           // short fact for Level 2
    let imageName: String   
}
