//
//  SimpleGridUI.swift
//  SwiftUISample
//
//  Created by Arpit on 13/06/24.
//

import SwiftUI

struct SimpleGridUI: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 2, alignment: nil),
        GridItem(.flexible(), spacing: 2, alignment: nil),
        GridItem(.flexible(), spacing: 2, alignment: nil),
        GridItem(.flexible(), spacing: 2, alignment: nil)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 2) {
                Section(content: {
                    ForEach(0..<100) {
                        index in
                        Rectangle()
                            .fill(.green)
                            .frame(width: 70, height: 100)
                    }
                }, header: {
                    Text("Section 1")
                        .foregroundStyle(.blue)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(.orange)
                        .padding()
                })
                
                Section(content: {
                    ForEach(0..<100) {
                        index in
                        Rectangle()
                            .fill(.red)
                            .frame(width: 70, height: 100)
                    }
                }, header: {
                    Text("Section 2")
                        .foregroundStyle(.blue)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(.orange)
                        .padding()
                })
            }
        }
    }
}

#Preview {
    SimpleGridUI()
}
