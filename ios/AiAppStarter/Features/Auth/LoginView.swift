import SwiftUI

struct LoginView: View {
    @ObservedObject var session: SessionViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        Form {
            Section("Login") {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()

                SecureField("Password", text: $password)

                Button {
                    Task {
                        let didLogin = await session.login(
                            email: email,
                            password: password
                        )
                        if didLogin {
                            dismiss()
                        }
                    }
                } label: {
                    if session.isWorking {
                        Label("Logging In", systemImage: "arrow.triangle.2.circlepath")
                    } else {
                        Label("Login", systemImage: "person.crop.circle")
                    }
                }
                .disabled(!canSubmit || session.isWorking)
            }

            if let message = session.errorMessage {
                Section {
                    AppErrorMessage(message: message)
                }
            }

            Section {
                NavigationLink {
                    SignupView(session: session)
                } label: {
                    Label("Create an account", systemImage: "person.crop.circle.badge.plus")
                }
            }
        }
        .navigationTitle("Login")
    }

    private var canSubmit: Bool {
        !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
            !password.isEmpty
    }
}
