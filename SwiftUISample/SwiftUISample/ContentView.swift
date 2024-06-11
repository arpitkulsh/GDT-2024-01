//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Arpit on 10/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe.central.south.asia.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .font(.largeTitle)
            Text("Hello, world!")
                .font(.largeTitle)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
