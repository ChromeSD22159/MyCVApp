//
//  sleep.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//
import SwiftUI

func sleep(await: Double, onComplete: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        onComplete()
    }
}
