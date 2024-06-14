//
//  SignupUIComponents.swift
//  SwiftUISample
//
//  Created by Arpit on 15/06/24.
//

import SwiftUI

struct SignupUIComponents: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            InputField(title: "Name", text: $name, keyboardType: .default)
            InputField(title: "Email", text: $name, keyboardType: .default)
            SecureInput(title: "Password", text: $password)
            
            AppButtonUI(title: "Sign Up", action: {
                submitData()
                showAlert = true
            })
            
        }
        .alert("Title", isPresented: $showAlert) {
            
        } message: {
            Text("Some message")
        }
    }
    
    func submitData() {
        
    }
}

struct InputField: View {
    
    var title: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        TextField(title, text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(6.0)
            .keyboardType(keyboardType)
            .autocapitalization(.none)
            .autocorrectionDisabled()
    }
}

struct SecureInput: View {
    var title: String
    @Binding var text: String
    var body: some View {
        SecureField(title, text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(6.0)
    }
}

struct AppButtonUI: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.blue)
                .cornerRadius(6.0)
        }
    }
}

#Preview {
    SignupUIComponents()
}
