//
//  ContentView.swift
//  UnitConversion
//
//  Created by Mihai Constantin on 16.07.2024.
//

import SwiftUI

enum LengthUnit {
    case meter
    case kilometer
    case feet
    case yard
    case mile
}

struct ContentView: View {
    
    @State private var input: Double = 0.0
    
    @State private var inputUnitSelected: LengthUnit = .meter
    @State private var outputUnitSelected: LengthUnit = .meter
    
    @FocusState private var inputSelected: Bool
    
    var lengthUnits: [LengthUnit] = [
        .meter,
        .kilometer,
        .feet,
        .yard,
        .mile
    ]
    
    var outputValue: Double {
        // 1. Convert input to mm
        var inputInMM = 0.0
        switch inputUnitSelected {
        case .meter:
            inputInMM = pow(10, 3) * input
        case .kilometer:
            inputInMM = pow(10, 6) * input
        case .feet:
            inputInMM = 304.8 * input
        case .yard:
            inputInMM = 914.4 * input
        case .mile:
            inputInMM = 1609344 * input
        }
        
        // 2. Convert to output unit
        switch outputUnitSelected {
        case .meter:
            return pow(10, -3) * inputInMM
        case .kilometer:
            return pow(10, -6) * inputInMM
        case .feet:
            return 0.0032808399 * inputInMM
        case .yard:
            return 0.0010936133 * inputInMM
        case .mile:
            return 6.21371192 * pow(10, -7) * inputInMM
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input") {
                    HStack {
                        TextField("Input", value: $input, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($inputSelected)
                        
                        Picker("", selection: $inputUnitSelected) {
                            ForEach(lengthUnits, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                }
                
                Section("Output") {
                    
                    Picker("Unit", selection: $outputUnitSelected) {
                        ForEach(lengthUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("\(outputValue.formatted())")
                }
            }
            .navigationTitle("Units Conversion")
            .toolbar {
                if inputSelected {
                    Button("Done") {
                        inputSelected = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
