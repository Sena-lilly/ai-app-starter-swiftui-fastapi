import SwiftUI

struct AppErrorMessage: View {
    let message: String

    var body: some View {
        Label(message, systemImage: "exclamationmark.triangle.fill")
            .font(.body)
            .foregroundStyle(.red)
            .padding(.vertical, 4)
    }
}
