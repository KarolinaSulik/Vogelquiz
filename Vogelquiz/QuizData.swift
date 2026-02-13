import Foundation

enum QuizData {

    static let birds: [Bird] = [

        // --- Singvögel / Gartenvögel ---
        Bird(
            name: "Amsel",
            scientificName: "Turdus merula",
            hint: "Männchen meist schwarz, gelber Schnabel.",
            fact: "Diese Vogelart ist häufig in Gärten zu sehen und singt oft in den frühen Morgen- und Abendstunden.",
            imageName: nil
        ),

        Bird(
            name: "Star",
            scientificName: "Sturnus vulgaris",
            hint: "Dunkel mit metallischem Glanz, oft in Schwärmen.",
            fact: "Diese Vogelart kann Geräusche und andere Vogelstimmen sehr gut nachahmen.",
            imageName: nil
        ),

        Bird(
            name: "Haussperling",
            scientificName: "Passer domesticus",
            hint: "Klein, braun-grau, lebt oft in Gruppen.",
            fact: "Diese Art lebt meist in der Nähe des Menschen und tritt häufig in kleinen Gruppen auf.",
            imageName: nil
        ),

        Bird(
            name: "Blaumeise",
            scientificName: "Cyanistes caeruleus",
            hint: "Blauer Kopf, gelber Bauch, sehr klein.",
            fact: "Diese kleine Vogelart frisst vor allem Insekten und im Winter auch Samen.",
            imageName: nil
        ),

        Bird(
            name: "Kohlmeise",
            scientificName: "Parus major",
            hint: "Schwarzer Kopf mit weißen Wangen, gelber Bauch.",
            fact: "Diese Vogelart ist sehr anpassungsfähig und kommt häufig in Parks und Gärten vor.",
            imageName: nil
        ),

        Bird(
            name: "Rotkehlchen",
            scientificName: "Erithacus rubecula",
            hint: "Orange-rote Brust, wirkt oft zutraulich.",
            fact: "Diese Vogelart ist sehr territorial und verteidigt ihr Revier energisch.",
            imageName: nil
        ),

        Bird(
            name: "Buchfink",
            scientificName: "Fringilla coelebs",
            hint: "Rostrosa Brust, blau-grauer Kopf beim Männchen.",
            fact: "Diese Vogelart ist weit verbreitet und besonders im Frühling sehr gesangsaktiv.",
            imageName: nil
        ),

        Bird(
            name: "Zaunkönig",
            scientificName: "Troglodytes troglodytes",
            hint: "Sehr klein, oft mit aufgerichtetem Schwanz.",
            fact: "Diese sehr kleine Vogelart baut mehrere Nester, nutzt jedoch meist nur eines davon.",
            imageName: nil
        ),

        Bird(
            name: "Schwanzmeise",
            scientificName: "Aegithalos caudatus",
            hint: "Sehr kleiner Vogel mit auffallend langem Schwanz.",
            fact: "Diese Vogelart ist für ihren sehr langen Schwanz und kunstvoll gebaute Nester bekannt.",
            imageName: nil
        ),

        Bird(
            name: "Nachtigall",
            scientificName: "Luscinia megarhynchos",
            hint: "Unauffällig braun, aber sehr kräftiger Gesang.",
            fact: "Diese Vogelart ist vor allem für ihren besonders abwechslungsreichen und lauten Gesang bekannt.",
            imageName: nil
        ),

        Bird(
            name: "Elster",
            scientificName: "Pica pica",
            hint: "Schwarz-weiß, langer Schwanz, oft neugierig.",
            fact: "Diese Vogelart gilt als sehr intelligent und kann komplexe Probleme lösen.",
            imageName: nil
        ),

        Bird(
            name: "Eichelhäher",
            scientificName: "Garrulus glandarius",
            hint: "Bräunlich mit blau-schwarz gebänderten Flügelfeldern.",
            fact: "Diese Vogelart sammelt Samen und trägt zur natürlichen Verbreitung von Bäumen bei.",
            imageName: nil
        ),

        Bird(
            name: "Kleiber",
            scientificName: "Sitta europaea",
            hint: "Kann kopfüber an Baumstämmen laufen.",
            fact: "Diese Vogelart gehört zu den wenigen, die auch kopfüber an Baumstämmen klettern können.",
            imageName: nil
        ),

        Bird(
            name: "Buntspecht",
            scientificName: "Dendrocopos major",
            hint: "Schwarz-weiß, roter Bereich am Unterschwanz.",
            fact: "Diese Vogelart sucht Nahrung unter der Baumrinde und trommelt häufig an Stämmen.",
            imageName: nil
        ),

        Bird(
            name: "Rauchschwalbe",
            scientificName: "Hirundo rustica",
            hint: "Schlank, langer gegabelter Schwanz.",
            fact: "Diese Vogelart ist ein Langstreckenzieher und kehrt im Frühjahr aus Afrika zurück.",
            imageName: nil
        ),

        // --- Stadt- und Wasservögel ---
        Bird(
            name: "Stadttaube",
            scientificName: "Columba livia domestica",
            hint: "Grauer Vogel, häufig in Innenstädten.",
            fact: "Diese Vogelart ist stark an urbane Lebensräume angepasst.",
            imageName: nil
        ),

        Bird(
            name: "Graureiher",
            scientificName: "Ardea cinerea",
            hint: "Groß, grau, lange Beine, steht oft reglos.",
            fact: "Diese Vogelart jagt meist reglos im Wasser und ernährt sich vor allem von Fischen.",
            imageName: nil
        ),

        Bird(
            name: "Kranich",
            scientificName: "Grus grus",
            hint: "Groß, oft in Formationen, laute Rufe.",
            fact: "Diese Vogelart ist bekannt für laute Rufe und auffällige Balztänze.",
            imageName: nil
        ),

        Bird(
            name: "Weißstorch",
            scientificName: "Ciconia ciconia",
            hint: "Sehr groß, weiß-schwarz, lange rote Beine.",
            fact: "Diese Vogelart legt weite Zugstrecken zurück und überwintert häufig in Afrika.",
            imageName: nil
        ),

        // --- Greifvögel und Eulen ---
        Bird(
            name: "Mäusebussard",
            scientificName: "Buteo buteo",
            hint: "Kräftiger Greifvogel, oft auf Pfählen sitzend.",
            fact: "Diese Greifvogelart jagt überwiegend kleine Säugetiere auf offenen Flächen.",
            imageName: nil
        ),

        Bird(
            name: "Steinadler",
            scientificName: "Aquila chrysaetos",
            hint: "Sehr großer Greifvogel mit breiten Flügeln.",
            fact: "Diese große Greifvogelart nutzt Thermik zum energiesparenden Segelflug.",
            imageName: nil
        ),

        Bird(
            name: "Uhu",
            scientificName: "Bubo bubo",
            hint: "Große Eule mit Federohren, nachtaktiv.",
            fact: "Diese nachtaktive Vogelart gehört zu den größten Eulen Europas.",
            imageName: nil
        ),

        // --- Rabenvögel ---
        Bird(
            name: "Rabenkrähe",
            scientificName: "Corvus corone",
            hint: "Ganz schwarz, sehr anpassungsfähig.",
            fact: "Diese Vogelart zeigt ein ausgeprägtes Lern- und Problemlösungsverhalten.",
            imageName: nil
        ),

        Bird(
            name: "Kolkrabe",
            scientificName: "Corvus corax",
            hint: "Sehr groß, tiefes Rufen, kräftiger Schnabel.",
            fact: "Diese sehr große Vogelart lebt oft in festen Paarbeziehungen und großen Revieren.",
            imageName: nil
        ),

        // --- Exoten / flugunfähige Vögel ---
        Bird(
            name: "Pinguin",
            scientificName: "Spheniscidae",
            hint: "Schwarz-weiß, flugunfähig, sehr guter Schwimmer.",
            fact: "Diese Vogelart ist hervorragend an das Leben im Wasser angepasst.",
            imageName: nil
        ),

        Bird(
            name: "Strauß",
            scientificName: "Struthio camelus",
            hint: "Sehr groß, flugunfähig, lange Beine.",
            fact: "Diese Vogelart ist flugunfähig, kann jedoch sehr hohe Laufgeschwindigkeiten erreichen.",
            imageName: nil
        ),

        Bird(
            name: "Flamingo",
            scientificName: "Phoenicopteridae",
            hint: "Rosa Gefieder, lange Beine.",
            fact: "Diese Vogelart erhält ihre auffällige Färbung durch Farbstoffe aus der Nahrung.",
            imageName: nil
        ),

        Bird(
            name: "Pelikan",
            scientificName: "Pelecanus",
            hint: "Großer Schnabel mit dehnbarem Kehlsack.",
            fact: "Diese Vogelart nutzt einen dehnbaren Kehlsack, um Nahrung aus dem Wasser aufzunehmen.",
            imageName: nil
        )
    ]


    // MARK: - Level 1: Identify
    //make the identify question with 4 answers
    static func level1Questions() -> [QuizQuestion] {
        let allNames = birds.map { $0.name }// from every bird take only the name

        func makeIdentifyQuestion(for bird: Bird) -> QuizQuestion {
            // Choose 3 wrong options + 1 correct, shuffled
            let wrong = allNames.filter { $0 != bird.name }.shuffled().prefix(3)
            let opts = ([bird.name] + wrong).shuffled()

            return QuizQuestion(
                kind: .identify(bird: bird),
                question: "Which bird is it?",
                options: opts,
                correctAnswer: bird.name,
                explanation: bird.hint
            )
        }

        // Make one question per bird (8 questions)
        return birds.map { makeIdentifyQuestion(for: $0) }.shuffled()
    }

    // MARK: - Level 2: Facts
    static func level2Questions() -> [QuizQuestion] {
        birds.map { bird in
            QuizQuestion(
                kind: .fact(bird: bird),
                question: "Which statement is true about \(bird.name)?",
                options: makeFactOptions(for: bird),
                correctAnswer: bird.fact,
                explanation: "Info: \(bird.scientificName)"
            )
        }
        .shuffled()
    }

    //make the fact question with 4 answers
    private static func makeFactOptions(for correctBird: Bird) -> [String] {
        // Correct fact + 3 facts from other birds
        let otherFacts = birds
            .filter { $0.name != correctBird.name }
            .map { $0.fact }
            .shuffled()
            .prefix(3)

        return ([correctBird.fact] + otherFacts).shuffled()
    }
}
