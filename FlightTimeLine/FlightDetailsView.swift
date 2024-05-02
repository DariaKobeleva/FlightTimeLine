//
//  FlighDetailsView.swift
//  FlightTimeLine
//
//  Created by Дарья Кобелева on 02.05.2024.
//

import SwiftUI

struct FlightDetailsView: View {
    @Binding var isPresented: Bool
    let flight: FlightInformation
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(flight.airline) - Flight \(flight.number)")
                    .font(.title)
                Spacer()
                Button("Done") {
                    isPresented.toggle()
                }
            }
            Text("\(flight.direction == .arrival ? "From: " : "To: ") \(flight.otherAirport)")
            Text(flight.flightStatus)
                .foregroundStyle(Color(flight.timelineColor))
            Spacer()
        }
        .font(.headline)
        .padding()
    }
}

#Preview {
    FlightDetailsView(
        isPresented: .constant(true),
        flight: FlightInformation.generateFlight()
    )
}
