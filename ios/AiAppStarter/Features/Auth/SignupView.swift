import SwiftUI

struct SignupView: View {
    @ObservedObject var session: SessionViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        Form {
            Section("Signup") {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()

                SecureField("Password", text: $password)

                Button {
                    Task {
                        let didSignup = await session.signup(
                            email: email,
                            password: password
                        )
                        if didSignup {
                            dismiss()
                        }
                    }
                } label: {
                    if session.isWorking {
                        Label("Creating Account", systemImage: "arrow.triangle.2.circlepath")
                    } else {
                        Label("Create Account", systemImage: "person.crop.circle.badge.plus")
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
                    LoginView(session: session)
                } label: {
                    Label("Already have an account", systemImage: "person.crop.circle")
                }
            }
        }
        .navigationTitle("Signup")
    }

    private var canSubmit: Bool {
        !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
            !password.isEmpty
    }
}
