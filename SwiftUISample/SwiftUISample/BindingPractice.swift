//
//  BindingPractice.swift
//  SwiftUISample
//
//  Created by Arpit on 13/06/24.
//

import SwiftUI

struct BindingPractice: View {
    @State var backgroundColor: Color = Color.green
    @State var title: String = "Header"
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text(title)
                    .foregroundStyle(.white)
                ButtonView(background: $backgroundColor, titleHeader: $title)
            }
            
        }
    }
}

struct ButtonView: View {
    
    @Binding var background: Color
    @Binding var titleHeader: String
    @State var buttonColor: Color = Color.blue
    
    var body: some View {
        Button {
            background = Color.orange
            titleHeader = "Any New Title"
            buttonColor = Color.brown
        } label: {
            Text("Tap Me")
                .foregroundStyle(.white)
                .padding()
                .background(buttonColor)
                .cornerRadius(4.0)
        }
    }
}

#Preview {
    BindingPractice()
}
