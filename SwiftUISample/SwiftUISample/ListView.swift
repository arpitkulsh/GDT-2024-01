//
//  ListView.swift
//  SwiftUISample
//
//  Created by Arpit on 12/06/24.
//

import SwiftUI

struct ListView: View {
    @State var fruits: [String] = ["apple", "orange", "banana"]
    
    @State var veggies: [String] = ["Tomato", "Patato", "Carrot"]
    
    var body: some View {
        NavigationView{
            List {
                Section {
                    ForEach(fruits, id: \.self) { fruit in 
                        Text(fruit.capitalized)
                            .font(.title)
                            .foregroundStyle(.cyan)
                            .padding(.vertical)
                    }
                    .onDelete(perform: { indexSet in
                        delete(indexSet: indexSet)
                    })
                }
                header: {
                    HStack {
                        Text("Fruits")
                        Spacer()
                        Image(systemName: "flame.fill")
                    }
                    .font(.headline)
                    .foregroundStyle(.blue)
                }
                
                Section {
                    ForEach(veggies, id: \.self) { fruit in
                        Text(fruit.capitalized)
                            .font(.title)
                            .foregroundStyle(.cyan)
                            .padding(.vertical)
                    }
                }
                header: {
                HStack {
                    Text("Vegetables")
                    Spacer()
                    Image(systemName: "flame.fill")
                }
                .font(.headline)
                .foregroundStyle(.blue)
            }
            }
            .navigationTitle("Fruits List")
            .navigationBarItems(leading: addbutton, trailing: EditButton())
        }
    }
    
    var addbutton: some View {
        Button("Add", action: {
            add()
        })
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func add() {
        fruits.append("Grapes")
    }
}

#Preview {
    ListView()
}
