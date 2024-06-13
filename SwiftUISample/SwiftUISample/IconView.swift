//
//  IconView.swift
//  SwiftUISample
//
//  Created by Arpit on 10/06/24.
//

import SwiftUI

struct IconView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.badge.plus")
                .renderingMode(.original)
                .font(.largeTitle)
            Spacer()
            Image(systemName: "person.2.fill")
                .renderingMode(.original)
                .font(.largeTitle)
            Spacer()
            Image(systemName: "person.2.fill")
                .renderingMode(.original)
                .font(.largeTitle)
            
            
        }
        
    }
}

#Preview {
    IconView()
}
