//
//  Extension.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Mikhael Budi Mulya Marpaung on 20/07/22.
//

import Foundation
import SwiftUI


extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
