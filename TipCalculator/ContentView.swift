//
//  ContentView.swift
//  TipCalculator
//
//  Created by Alejandro Franco on 22/02/20.
//  Copyright © 2020 Alejandro Franco. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var totalCuenta = ""
    @State private var numeroPersonas = 2
    @State private var porcentajePropina = 1
    
    let porcentajesPropina = [0, 10, 15, 20, 25]
    
    var totalPorPersona: Double {
        let nPersonas = Double(numeroPersonas + 2)
        let pPropina = Double(porcentajesPropina[porcentajePropina]) / 100.00
        let tCuenta = Double(totalCuenta) ?? 0.00
        return tCuenta * pPropina / nPersonas
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Total cuenta", text: $totalCuenta)
                        .keyboardType(.decimalPad)
                    Picker("Número de personas", selection: $numeroPersonas) {
                        ForEach(2 ..< 50) { index in
                            Text("\(index) personas")
                        }
                    }
                }
                Section(header: Text("¿Cuánta propina deseas dejar?")) {
                    Picker("Porcentaje de propina", selection: $porcentajePropina) {
                        ForEach(0 ..< self.porcentajesPropina.count) {
                            Text("\(self.porcentajesPropina[$0]) %")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("$\(totalPorPersona, specifier: "%.2f")")
                }
            }.navigationBarTitle("Tip Calculator")
        }
    }
    
//    func calcular() -> Double {
//        let nPersonas = Double(numeroPersonas + 2)
//        let pPropina = Double(porcentajesPropina[porcentajePropina]) / 100.00
//        let tCuenta = Double(totalCuenta) ?? 0.00
//        return tCuenta * pPropina / nPersonas
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
