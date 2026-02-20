import Foundation
import SwiftUI

struct StartView: View {
    @ObservedObject var vm: QuizViewModel
    @State private var showAtlas = false
    
    let onSelectLevel: (QuizLevel) -> Void

    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            VStack(spacing: 48) {
                Text(vm.ui.navigationTitle)
                    .font(.largeTitle)
                    .bold()
                VStack(alignment: .leading, spacing: 16){
                    Text(vm.ui.chooseLevelTitle)
                        .font(.headline)
                    ForEach(QuizLevel.allCases, id: \.self) { level in
                        VStack(alignment: .leading, spacing: 16) {
                            AppButton(title: vm.levelTitle(level)) {
                                onSelectLevel(level)
                            }
                        }
                    }
                    AppButton(title: vm.ui.birdsAtlas) {
                        showAtlas = true
                    }
                    Spacer()
                    Text(vm.ui.textVogelStart)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
            }
            .padding()
            .padding(.bottom, 12)
            .frame(maxHeight: .infinity, alignment: .top)
            .sheet(isPresented: $showAtlas) {
                NavigationStack {
                    BirdLibraryView(vm: vm)
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button(vm.ui.doneButton) {
                                    showAtlas = false
                                }
                                .foregroundStyle(Color("AppTextDark"))
                            }
                        }
                }
            }
        }
        .onAppear {
            vm.load(language: .de)
        }
    }
}

