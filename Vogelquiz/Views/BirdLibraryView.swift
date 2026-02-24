import SwiftUI

struct BirdLibraryView: View {
    @ObservedObject var vm: QuizViewModel
    @State private var index: Int = 0

    var body: some View {
        ZStack {
            Color("AppBackground").ignoresSafeArea()
            if vm.birds.isEmpty {
                ProgressView(vm.ui.loadingText)
            } else {
                TabView(selection: $index) {
                    ForEach(Array(vm.birds.enumerated()), id: \.element.id) { i, bird in
                        BirdAtlasCard(vm: vm, bird: bird)
                            .padding()
                            .tag(i)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .automatic))
            }
        }
        .navigationTitle("Bird-Atlas")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct BirdAtlasCard: View {
    @ObservedObject var vm: QuizViewModel
    let bird: Bird

    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            Text(bird.name)
                .font(.title2)
                .fontWeight(.bold)
            Image(bird.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: 220)
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .background(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(.thinMaterial)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(.quaternary, lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.07), radius: 30, y: 15)

                VStack(alignment: .leading, spacing: 16) {
                    Text(bird.scientificName)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Divider()
                    Text(vm.ui.sectionDescription)
                        .font(.body.weight(.semibold))
                        .foregroundStyle(Color("AppTextDark"))
                    Text(bird.fact)
                        .font(.body.weight(.regular))
                        .foregroundStyle(Color("AppTextDark").opacity(0.7))
                    Text(vm.ui.sectionCharacteristics)
                        .font(.body.weight(.semibold))
                        .foregroundStyle(Color("AppTextDark"))
                    Text(bird.hint)
                        .font(.body.weight(.regular))
                        .foregroundStyle(Color("AppTextDark").opacity(0.7))
                    Spacer(minLength: 0)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
        }        
        .padding(16)
        .background(.thinMaterial)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: .black.opacity(0.03), radius: 30, y: 15)
    }
}
