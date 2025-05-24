//
//  CreateUserView.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 9/5/25.
//

import SwiftUI

struct CreateUserView: View {
    @Environment(UsersVM.self) var vm
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @Binding var isThisViewShown: Bool

    var body: some View {
            Form {
                Section("New User Details") {
                    TextField("First Name", text: $firstName)
                        .autocorrectionDisabled()

                    TextField("Last Name", text: $lastName)
                        .autocorrectionDisabled()

                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                }
                Section {
                    Button {
                        vm.createUser(firstName: firstName, lastName: lastName, email: email)
                        isThisViewShown.toggle()
                    } label: {
                        Text("Create User")
                            .frame(maxWidth: .infinity)
                    }
                }
                
                
            }
        }
    }


#Preview {
    @Previewable @State var isPresent = false
    CreateUserView(isThisViewShown: $isPresent)
        .environment(UsersVM())
}
