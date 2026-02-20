import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = QuizViewModel()
    @State private var selectedLevel: QuizLevel? = nil
    
    var body: some View {
        NavigationStack {
            if let level = selectedLevel {
                QuizView(
                    vm: vm,
                    level: level,
                    onBackToStart: { selectedLevel = nil },
                    onCancel: { selectedLevel = nil }
                )
            } else {
                StartView (vm: vm) { level in
                    selectedLevel = level
                }
            }
        }
        .onAppear {
            vm.load(language: .de)
        }
    }
}


#Preview {
    ContentView()
}

