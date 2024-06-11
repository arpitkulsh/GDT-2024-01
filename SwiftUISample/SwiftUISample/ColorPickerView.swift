//
//  ColorPickerView.swift
//  SwiftUISample
//
//  Created by Arpit on 11/06/24.
//

import SwiftUI

struct ColorPickerView: View {
    @State var backgroundColor: Color = .green
    var body: some View {
        ZStack {
            backgroundColor
            
            ColorPicker("Select a color", selection: $backgroundColor, supportsOpacity: true)
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .font(.headline)
                .padding(50)
        }
        
        
    }
}

#Preview {
    ColorPickerView()
}
