//
//  BackgroundOverlay.swift
//  SwiftUISample
//
//  Created by Arpit on 11/06/24.
//

import SwiftUI

struct BackgroundOverlay: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 80))
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(LinearGradient(colors: [Color.blue,Color.red], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                    .frame(width: 200,height: 200)
                    .shadow(color: .red, radius: 10, x: 0, y: -10)
                    .overlay(
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 70, height: 70)
                            .overlay(
                                Text("5")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                            .shadow(color: .black, radius: 10, x: 5, y:5)
                        ,alignment: .bottomTrailing
                            
                    
                    )
            )
    }
}

#Preview {
    BackgroundOverlay()
}
