import SwiftUI

struct AppButton: View {
    let title: String
    var alignment: Alignment = .leading
    var allowMultiline: Bool = true
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.body.weight(.semibold))
                .foregroundStyle(Color("AppText").opacity(0.7))
                .frame(maxWidth: .infinity, alignment: alignment)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color("AppButtonBackground"))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color("AppText").opacity(0.06), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.07), radius: 24, y: 12)
                .lineLimit(allowMultiline ? nil : 1)
        }
        .buttonStyle(.plain)
    }
}
