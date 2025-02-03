//
//  ContentView.swift
//  BetterRest
//
//  Created by Mihai Constantin on 28.08.2024.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    // Features
    @State private var wakeUp = defaultWakeTime // when I want to wake up
    @State private var sleepAmount = 8.0 // how much hours of sleep I want
    @State private var coffeeAmount = 1 // how many cups of coffee I drink during the day
    
    // Result: When should I go to bed
    private var sleepTime: String {
        return calculateBedtime()
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section("Daily coffee intake") {
//                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                    
                    Picker("Coffee intake", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) { idx in
                            Text("\(idx)")
                        }
                    }
                }
                
                Section("Bedtime") {
                    Text(sleepTime)
                }
            }
            .navigationTitle("BetterRest")
        }
    }
    
    func calculateBedtime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            // get hour and minutes components from wakeUp Date object
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 3600
            let minute = (components.minute ?? 0) * 60
            
            
            let prediction = try model.prediction(wake: Double(hour + minute),
                                                  estimatedSleep: sleepAmount,
                                                  coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return "Your ideal bed time is " + sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            // something went wrong
            return "Error"
        }
    }
}

#Preview {
    ContentView()
}
