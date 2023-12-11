//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Mihai Constantin on 11.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.bolt.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.snow.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sun.max.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.rain.fill", temperature: 74)
                }
                
                Spacer()
                
                Button(action: {
                    isNight.toggle()
                }, label: {
                    WeatherButton(title: "Change day time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                    
                })
                
                Spacer()
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.black, .white, .red)
            Text("\(temperature)°")
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [ isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")],
                       startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}


struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
