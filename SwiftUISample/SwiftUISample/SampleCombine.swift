//
//  SampleCombine.swift
//  SwiftUISample
//
//  Created by Arpit on 01/07/24.
//

import SwiftUI
import Combine

class MessagePublisher: ObservableObject {
    
    var messagePublisher = PassthroughSubject<String, Never>()
    
    func sendMessage(_ message: String) {
        messagePublisher.send(message)
    }
}

struct CombineContentView: View {
    
    @StateObject private var messagePublisher = MessagePublisher()
    @State private var receivedMessage: String = "No Message"
    @State private var cancellable: AnyCancellable?
    
    var body: some View {
        VStack {
            Text(receivedMessage)
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                messagePublisher.sendMessage("Hello World")
            }, label: {
                Text("Send Message")
                    .padding()
                    .background(.red)
                    .cornerRadius(8.0)
            })
        }
        .onAppear {
           cancellable = messagePublisher.messagePublisher
                .sink(receiveValue: {
                    message in
                    
                    self.receivedMessage = message
                })
        }
        .onDisappear {
            cancellable?.cancel()
        }
    }
}

#Preview {
    CombineContentView()
}

