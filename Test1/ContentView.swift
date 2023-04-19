//
//  ContentView.swift
//  Test1
//
//  Created by Jacek Placek on 19/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var koszt = 0.0
    @State private var ludzie = 2
    @State private var tip = 20
    
    
    let tips = [5,10,15,20,25,30,0]
    
    var total: Double {
        let lud = Double(ludzie + 2)
        let tipp = Double(tip)
        
        let tipV = koszt / 100 * tipp
        let Gtotal = koszt + tipV
        let NaOsobe = Gtotal / lud
        
        return NaOsobe
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Należność", value: $koszt, format: .currency(code: Locale.current.currency?.identifier ?? "PLN"))
                        .keyboardType(.decimalPad)
                    
                    Picker("ilość osób ", selection: $ludzie) {
                        ForEach(2..<100) {
                            Text("\($0) osoby")
                        }
                    }
                }
                
                
                Section {
                    Picker("Ile procent napiwku", selection: $tip) {
                        ForEach(tips, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Jak dużo napiwku chcesz zostawić")
                }
                Section {
                    Text(total, format: .currency(code:  Locale.current.currency?.identifier ?? "PLN"))
                }
                
                
                
            .navigationTitle("Kalkulator dla ułomnych")
            .navigationBarTitleDisplayMode(.inline)
            }
         }
     }
 }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
