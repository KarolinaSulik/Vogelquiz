import SwiftUI

struct ContentView: View {

    @State private var selectedLevel: QuizLevel? = nil
    
    var body: some View {
        NavigationStack {
            if let level = selectedLevel {
                QuizView(
                    level: level,
                    onBackToStart: { selectedLevel = nil },
                    onCancel: { selectedLevel = nil }
                )
            } else {
                StartView { level in
                    selectedLevel = level
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
