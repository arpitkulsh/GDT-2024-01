//
//  TextView.swift
//  SwiftUISample
//
//  Created by Arpit on 10/06/24.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Text("Hello World".lowercased())
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .frame(width: 200, height: 200, alignment: .center)
            .font(.title)
            .minimumScaleFactor(0.2)
    }
}

#Preview {
    TextView()
}
