//
//  ScrollViewUI.swift
//  SwiftUISample
//
//  Created by Arpit on 13/06/24.
//

import SwiftUI

struct ScrollViewUI: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<50) {
                    index in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(0..<20) {
                                index in
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color.cyan)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewUI()
}
