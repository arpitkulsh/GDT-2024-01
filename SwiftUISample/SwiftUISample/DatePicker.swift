//
//  DatePicker.swift
//  SwiftUISample
//
//  Created by Arpit on 11/06/24.
//

import SwiftUI

struct DatePickerView: View {
    
    @State var selectedDate: Date = Date()
    
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    
    let endingDate: Date = Date()
    
    var dateformatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("SELCTED DATE IS:")
            Text(dateformatter.string(from: selectedDate))
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            DatePicker("Select A Date", selection: $selectedDate, displayedComponents: [.date])
                .tint(.red)
                .datePickerStyle(CompactDatePickerStyle())
        }
    }
}

#Preview {
    DatePickerView()
}
