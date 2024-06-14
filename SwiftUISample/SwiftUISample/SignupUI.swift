//
//  SignupUI.swift
//  SwiftUISample
//
//  Created by Arpit on 14/06/24.
//

import SwiftUI

struct SignupUI: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Name", text: $name)
                .padding()
                .background(Color(.systemGray4))
                .cornerRadius(6.0)
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray4))
                .cornerRadius(6.0)
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray4))
                .cornerRadius(6.0)
            
            Button(action: {
                submitData()
                showAlert = true
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.blue)
                    .cornerRadius(6.0)
            }
        }
        .alert("Title", isPresented: $showAlert) {
            
        } message: {
            Text("Some message")
        }
        
    }
    
    func submitData() {
        
    }
}

//#Preview {
//    SignupUI()
//}
