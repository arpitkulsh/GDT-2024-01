//
//  MenuPractice.swift
//  SwiftUISample
//
//  Created by Arpit on 14/06/24.
//

import SwiftUI

struct MenuPractice: View {
    var body: some View {
        Menu("Click Me") 
        {
            Button("One") {
                
            }
            Button("Two") {
                
            }
            Button("Three") {
                
            }
            Button("Four") {
                
            }
        }
        .background(.cyan)
    }
}

#Preview {
    MenuPractice()
}
