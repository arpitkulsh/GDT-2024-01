//
//  ImageDownload.swift
//  SwiftUISample
//
//  Created by Arpit on 14/06/24.
//

import SwiftUI

struct ImageDownload: View {
    let imageURL: URL = URL(string: "https://picsum.photos/id/1/200/300")!
    var body: some View {
        VStack {
            AsyncImage(url: imageURL) {
                phase in
                switch(phase) {
                case .empty:
                    ProgressView().progressViewStyle(CircularProgressViewStyle())
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 200)
                        .cornerRadius(10)
                case .failure(_):
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 100)
                        .cornerRadius(10)
                @unknown default:
                    EmptyView()
                }
            }
            Text("Sample Image")
                .font(.headline)
        }
    }
}

#Preview {
    ImageDownload()
}
