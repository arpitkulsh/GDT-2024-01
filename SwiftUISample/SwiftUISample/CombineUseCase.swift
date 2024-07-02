//
//  CombineUseCase.swift
//  SwiftUISample
//
//  Created by Arpit on 28/06/24.
//

import Foundation
import SwiftUI

class MyViewModel: ObservableObject {
    @Published var value: String = "Initial Value"
    var xyz: String = "123"
}

struct ParantView: View {
    @StateObject private var viewModel = MyViewModel()

    var body: some View {
        EmptyView()
       // ChildView(vModel: viewModel)
    }
    
}

struct ChildView: View {
    
    @ObservedObject var vModel: MyViewModel
    
    var body: some View {
        Text(vModel.value)
            .padding()
            .onAppear {
                //vModel.value = "Later Value"
                vModel.xyz = ""
            }
    }
}
