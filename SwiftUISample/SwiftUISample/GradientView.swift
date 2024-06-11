//
//  GradientView.swift
//  SwiftUISample
//
//  Created by Arpit on 10/06/24.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0).fill(
            
            AngularGradient.init(gradient: Gradient(colors: [Color.red, Color.blue, Color.brown]), center: .topLeading, angle: .degrees(180 + 45))
            
        )
        .frame(width: 300, height: 200)
    }
}

#Preview {
    GradientView()
}
