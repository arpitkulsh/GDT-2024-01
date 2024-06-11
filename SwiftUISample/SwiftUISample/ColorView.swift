//
//  ColorView.swift
//  SwiftUISample
//
//  Created by Arpit on 10/06/24.
//

import SwiftUI

struct ColorView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0).fill(
            Color("CustomColor")
        ).frame(width: 300, height: 200)
            .shadow(color: .blue, radius: 10, x: -10, y: -10)
    }
}

#Preview {
    ColorView()
}
