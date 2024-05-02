//
//  FlightBoardView.swift
//  FlightTimeLine
//
//  Created by Дарья Кобелева on 02.05.2024.
//

import SwiftUI

struct FlightBoardView: View {
    let title: String
    let flights: [FlightInformation]
    
    @State private var hiddenCanceled = false
    
    private var shownFlights: [FlightInformation] {
        hiddenCanceled
        ? flights.filter { $0.status != .cancelled }
        : flights
    }
    var body: some View {
        List(shownFlights) { flight in
            FlightRowView(flight: flight)
        }
        .listStyle(.plain)
        .navigationTitle(title)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Toggle("Hide canceled", isOn: $hiddenCanceled)
            }
        }
    }
}

#Preview {
    FlightBoardView(
        title: "Board Title",
        flights: FlightInformation.generateFlights()
    )
}
