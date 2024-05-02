//
//  HomeView.swift
//  FlightTimeLine
//
//  Created by Дарья Кобелева on 02.05.2024.
//

import SwiftUI

struct HomeView: View {
    private let flights = FlightInformation.generateFlights()
    private var arrivals: [FlightInformation] {
        flights.filter { $0.direction == .arrival }
    }
    private var departures: [FlightInformation] {
        flights.filter { $0.direction == .departure }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .opacity(0.1)
                    .rotationEffect(.degrees(-90))
                
                VStack(alignment: .leading, spacing: 10) {
                    NavigationLink("Arrivals") {
                        FlightBoardView(title: "Arrivals",flights: arrivals)
                    }
                    
                    NavigationLink("Departures") {
                        FlightBoardView(title: "Departures", flights: departures)
                    }
                    
                    NavigationLink("Flight TimeLine") {
                        TimelineView(flights: flights )
                    }
                    Spacer()
                }
                .font(.title)
                .padding()
                
                
            }
            .navigationTitle("Airport")
        }
    }
}

#Preview {
    HomeView()
}
