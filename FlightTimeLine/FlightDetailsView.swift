//
//  FlighDetailsView.swift
//  FlightTimeLine
//
//  Created by Дарья Кобелева on 02.05.2024.
//

import SwiftUI

struct FlightDetailsView: View {
    let flight: FlightInformation
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(flight.airline) - Flight \(flight.number)")
                    .font(.title)
                Spacer()
    
            }
            Text("\(flight.direction == .arrival ? "From: " : "To: ") \(flight.otherAirport)")
            Text(flight.flightStatus)
                .foregroundStyle(Color(flight.timelineColor))
            Spacer()
        }
        .font(.headline)
        .padding()
        .navigationTitle("Flight Details")
    }
}

#Preview {
    FlightDetailsView(
        flight: FlightInformation.generateFlight()
    )
}
