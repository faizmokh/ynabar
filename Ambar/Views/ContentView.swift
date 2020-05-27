//
//  ContentView.swift
//  Ambar
//
//  Created by Anagh Sharma on 12/11/19.
//  Copyright © 2019 Golden Chopper. All rights reserved.
//

import SwiftUI
import AppKit

struct ContentView: View {

    @State private var transactionAmount: String = ""
    @State private var payee: String = ""
    @State private var isMinus: Bool = false
    private var transactionOptions = ["+", "-"]
    private var payees = ["Transfer: RHB", "Transfer: Wallet", "Transfer: GrabPay"]
    private var categories = ["Postpaid", "Parents", "Rent", "Internet", "Car Loans"]
    private var repeatType = ["Never", "Daily", "Weekly", "Every other week", "Twice a month"]

    @State private var selectedTransactionOption: String = ""
    @State private var selectedPayee: String = ""
    @State private var selectedCategory: String = ""
    @State private var selectedAccount: String = ""
    @State private var transactionDate: Date = Date()
    @State private var selectedRepeatType: String = ""

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Add New Transaction")
                .fontWeight(.medium)
                .padding(.bottom, 5)
            Form {
                Section {
                HStack {
                    Picker(selection: $selectedTransactionOption, label: Text("Amount")) {
                        ForEach(0..<transactionOptions.count) {
                            Text(self.transactionOptions[$0])
                        }
                        .scaledToFit()
                    }.pickerStyle(SegmentedPickerStyle())
                    TextField("0.00", text: $transactionAmount)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Picker(selection: $selectedPayee, label: Text("Payee")) {
                    ForEach(0..<payees.count) {
                        Text(self.payees[$0])
                    }
                }.pickerStyle(DefaultPickerStyle())
                Picker(selection: $selectedCategory, label: Text("Category")) {
                    ForEach(0..<categories.count) {
                        Text(self.categories[$0])
                    }
                }.pickerStyle(DefaultPickerStyle())
                Picker(selection: $selectedAccount, label: Text("Account")) {
                    ForEach(0..<payees.count) { index in
                        Text(self.payees[index])
                        .tag(index)
                    }
                }.pickerStyle(DefaultPickerStyle())
                DatePicker(selection: $transactionDate, in: ...Date(), displayedComponents: .date) {
                    Text("Date")
                }
                .datePickerStyle(DefaultDatePickerStyle())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Picker(selection: $selectedRepeatType, label: Text("Repeat")) {
                    ForEach(0..<repeatType.count) {
                        Text(self.repeatType[$0])
                    }
                }.pickerStyle(DefaultPickerStyle())
                }
                Section {
                Button(action: {
                    NSApplication.shared.terminate(self)
                }, label: {
                    Text("Save Transaction")
                }).buttonStyle(DefaultButtonStyle())
                .foregroundColor(Color.primary)
                }
            }
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
