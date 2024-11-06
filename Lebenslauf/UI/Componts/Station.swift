//
//  Station.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//
import SwiftUI

struct Station: View {
    let item: CVStation
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(item.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                let from = formateDateMMYY(date: item.from)
                let till = formateDateMMYY(date: item.till)
                Text("\(from) - \(till)")
                    .font(.subheadline)
            }
            
            Text(item.description)
                .font(.footnote)
        }
        .padding(Theme.padding)
        .background(
            RoundedRectangle(cornerRadius: Theme.padding)
                .fill(Material.ultraThinMaterial)
        )
    }
}
