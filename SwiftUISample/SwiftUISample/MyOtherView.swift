//
//  MyOtherView.swift
//  SwiftUISample
//
//  Created by Arpit on 13/06/24.
//

import SwiftUI

struct MyOtherView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            Color.green.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .navigationTitle("For Back Scrren")
                .navigationBarHidden(true)
            
            VStack {
                Button("Back Button") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            
        }
    }
}

#Preview {
    MyOtherView()
}
