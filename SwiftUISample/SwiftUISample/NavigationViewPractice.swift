//
//  NavigationViewPractice.swift
//  SwiftUISample
//
//  Created by Arpit on 13/06/24.
//

import SwiftUI

struct NavigationViewPractice: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink("Go To Next", destination: MyOtherView())
            }
            .navigationTitle("Header")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar, content: 
                {
                    HStack {
                        Image(systemName: "person.fill")
                        Image(systemName: "flame.fill")
                    }
                    NavigationLink {
                        MyOtherView()
                    } label: {
                         Image(systemName: "gear")
                    }
                    
                })
            }
        }
    }
}


#Preview {
    NavigationViewPractice()
}
