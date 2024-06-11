//
//  AlertView.swift
//  SwiftUISample
//
//  Created by Arpit on 11/06/24.
//

import SwiftUI

struct AlertView: View {
    
    @State var showalert: Bool = false
    @State var background: Color = Color.white
    @State var alertTitle = ""
    @State var alertMessage = ""
    
    var body: some View {
        ZStack {
            background.edgesIgnoringSafeArea(.all)
            VStack {
                Button("Show Alert 1") {
                    alertTitle = "Error: Uploading videos"
                    alertMessage = "The video could not be shown"
                    showalert.toggle()
                    
                }
            }
            .alert(alertTitle, isPresented: $showalert) {
                
            } message: {
                Text(alertMessage)
            }
        }
        
    }
}

#Preview {
    AlertView()
}
