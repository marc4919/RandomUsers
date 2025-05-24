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

    var body: some View {
            Form {
                Section("New User Details") {
                    
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                }
                Section {
                    Button {
                        vm.createUser(firstName: firstName, lastName: lastName, email: email)
                    } label: {
                        Text("Create User")
                            .frame(maxWidth: .infinity)
                    }
                }
                
                
            }
        }
    }


#Preview {
    CreateUserView()
        .environment(UsersVM())
}
