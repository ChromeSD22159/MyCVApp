//
//  formateDateMMYY.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//
import Foundation

func formateDateMMYY(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/yy"
    return formatter.string(from: date)
}
