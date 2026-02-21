import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = QuizViewModel()
    @State private var selectedLevel: QuizLevel? = nil
    
    var body: some View {
        NavigationStack {
            StartView(vm: vm) { level in
                selectedLevel = level
            }
        .navigationDestination(item: $selectedLevel) { level in
            QuizView(
                vm: vm,
                level: level,
                onBackToStart: { selectedLevel = nil }
            )
        }
        }
        .onAppear {
            vm.loadForCurrentSystemLanguage()
        }
    }
}


#Preview {
    ContentView()
}

