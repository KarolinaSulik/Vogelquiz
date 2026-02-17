import Foundation

enum BirdRepositoryError: Error {
    case fileNotFound
    case decodeFailed(Error)
}

final class BirdRepository {

    static func loadRoot(from filename: String = "birds", fileExtension: String = "json") throws -> BirdsRoot {
        guard let url = Bundle.main.url(forResource: filename, withExtension: fileExtension) else {
            throw BirdRepositoryError.fileNotFound
        }
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(BirdsRoot.self, from: data)
        } catch {
            throw BirdRepositoryError.decodeFailed(error)
        }
    }

    static func loadBirds(language: AppLanguage) throws -> [Bird] {
        let root = try loadRoot()
        return root.birds.map { birdJSON in
            let lang = (language == .de) ? birdJSON.text.de : birdJSON.text.en
            return Bird(
                id: birdJSON.id,
                name: lang.name,
                scientificName: birdJSON.scientificName,
                hint: lang.hint,
                fact: lang.fact,
                imageName: birdJSON.imageName
            )
        }
    }

    static func loadUI(language: AppLanguage) throws -> QuizUIStrings {
        let root = try loadRoot()
        func pick(_ loc: LocalizedString) -> String {
            language == .de ? loc.de : loc.en
        }
        return QuizUIStrings(
            identifyQuestion: pick(root.ui.identifyQuestion),
            factQuestionTemplate: pick(root.ui.factQuestionTemplate),
            infoPrefix: pick(root.ui.infoPrefix),
            continueButton: pick(root.ui.continueButton),
            loadingText: pick(root.ui.loadingText),
            scoreLabel: pick(root.ui.scoreLabel),
            questionProgressTemplate: pick(root.ui.questionProgressTemplate),
            navigationTitle: pick(root.ui.navigationTitle),
            correctTitle: pick(root.ui.correctTitle),
            wrongTitle: pick(root.ui.wrongTitle),
            startButton: pick(root.ui.startButton),
            chooseLevelTitle: pick(root.ui.chooseLevelTitle),
            level1Title: pick(root.ui.level1Title),
            level2Title: pick(root.ui.level2Title),
            restartLevel: pick(root.ui.restartLevel),
            backToStart: pick(root.ui.backToStart),
            result: pick(root.ui.result),
            resultScore: pick(root.ui.resultScore)
        )
    }
}

struct QuizUIStrings {
    let identifyQuestion: String
    let factQuestionTemplate: String
    let infoPrefix: String
    let continueButton: String
    let loadingText: String
    let scoreLabel: String
    let questionProgressTemplate: String
    let navigationTitle: String
    let correctTitle: String
    let wrongTitle: String
    let startButton: String
    let chooseLevelTitle: String
    let level1Title: String
    let level2Title: String
    let restartLevel: String
    let backToStart: String
    let result: String
    let resultScore: String
}
